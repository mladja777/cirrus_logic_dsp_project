#include <stdio.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <string.h>
#include <stdfix_emu.h>
#include <common.h>
#include <compressor.h>

#define BLOCK_SIZE 16
#define MAX_NUM_CHANNEL 8

enum processing_output_mode_t { MODE2_0_0, MODE0_2_0, MODE3_2_0 };

__memY DSPfract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];

__memX DSPint output_channels[] = { 2, 2, 5 };

DSPfract gain6db_scaled = FRACT_NUM(0.501187);
DSPfract gain2db_scaled = FRACT_NUM(0.794328);
DSPfract processing_input_gain = FRACT_NUM(0.501187);
DSPfract processing_headroom_gain = FRACT_NUM(0.707946);

DSPint buffer_choice[3][5] = { { 0, 2, 0, 0, 0 }, { 3, 4, 0, 0, 0 }, { 0, 1, 2, 3, 4 } };

// Default processing compressor parameters for this project
DSPfract processing_compressor_threshold = FRACT_NUM(0.1);
DSPfract processing_compressor_ratio = FRACT_NUM(0.5);

__memX AudioCompressor_t processing_audio_compressor;

int processing_output_mode = MODE3_2_0;

void processing()
{
	// mode020
	if (processing_output_mode == MODE0_2_0)
	{
		__memY DSPfract *sbL = sampleBuffer[0];
		__memY DSPfract *sbC = sampleBuffer[1];
		__memY DSPfract *sbR = sampleBuffer[2];

		DSPint i;
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*sbC = (*sbL) * processing_input_gain + (*sbR) * processing_input_gain;
			sbR++;
			sbL++;
			sbC++;
		}
		sbL -= BLOCK_SIZE;
		sbC -= BLOCK_SIZE;
		sbR -= BLOCK_SIZE;

		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*sbC = (*sbC) * processing_headroom_gain;
			sbC++;
		}
		sbC -= BLOCK_SIZE;

		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*sbL = (*sbC) * gain6db_scaled;
			*sbR = (*sbC) * gain6db_scaled;
			sbL++;
			sbR++;
			sbC++;
		}
		sbL -= BLOCK_SIZE;
		sbC -= BLOCK_SIZE;
		sbR -= BLOCK_SIZE;
	}
	// mode200 and mode320
	else
	{
		__memY DSPfract *sbL = sampleBuffer[0];
		__memY DSPfract *sbC = sampleBuffer[1];
		__memY DSPfract *sbR = sampleBuffer[2];
		__memY DSPfract *sbLs = sampleBuffer[3];
		__memY DSPfract *sbRs = sampleBuffer[4];

		DSPint i;
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			// sampleBuffer[3][i] = sampleBuffer[0][i] * processing_input_gain;
			*sbLs = (*sbL) * processing_input_gain;
			// sampleBuffer[4][i] = sampleBuffer[2][i] * processing_input_gain;
			*sbRs = (*sbR) * processing_input_gain;
			// sampleBuffer[1][i] = sampleBuffer[3][i] + sampleBuffer[4][i];
			*sbC = *sbLs + *sbRs;
			// pointer increments
			sbLs++;
			sbL++;
			sbRs++;
			sbR++;
			sbC++;
		}
		// reseting pointers positions
		sbL = sampleBuffer[0];
		sbC = sampleBuffer[1];
		sbR = sampleBuffer[2];
		sbLs = sampleBuffer[3];
		sbRs = sampleBuffer[4];

		// sampleBuffer[3]
		gst_audio_dynamic_transform_compressor_double(&processing_audio_compressor, sbLs, BLOCK_SIZE);
		// sampleBuffer[4]
		gst_audio_dynamic_transform_compressor_double(&processing_audio_compressor, sbRs, BLOCK_SIZE);

		for (i = 0; i < BLOCK_SIZE; i++)
		{
			// sampleBuffer[1][i] = sampleBuffer[1][i] * processing_headroom_gain;
			*sbC = (*sbC) * processing_headroom_gain;
			sbC++;
		}
		// reseting sbC
		sbC = sampleBuffer[1];

		for (i = 0; i < BLOCK_SIZE; i++)
		{
			// sampleBuffer[0][i] = sampleBuffer[1][i] * gain6db_scaled;
			*sbL = (*sbC) * gain6db_scaled;
			// sampleBuffer[2][i] = sampleBuffer[1][i] * gain6db_scaled;
			*sbR = (*sbC) * gain6db_scaled;
			// ptr inc
			sbL++;
			sbR++;
			sbC++;
		}
		// reseting pointers positions
		sbL = sampleBuffer[0];
		sbC = sampleBuffer[1];
		sbR = sampleBuffer[2];

		for (i = 0; i < BLOCK_SIZE; i++)
		{
			// sampleBuffer[3][i] = sampleBuffer[3][i] * gain2db_scaled;
			*sbLs = (*sbLs) * gain2db_scaled;
			// sampleBuffer[4][i] = sampleBuffer[4][i] * gain2db_scaled;
			*sbRs = (*sbRs) * gain2db_scaled;
			// inc ptr
			sbLs++;
			sbRs++;
		}
		// ptr reset
		sbLs = sampleBuffer[3];
		sbRs = sampleBuffer[4];

		// TODO: ASM hw loop
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			// sampleBuffer[3][i] = sampleBuffer[0][i] + sampleBuffer[3][i];
			*sbLs += *sbL;
			// sampleBuffer[4][i] = sampleBuffer[2][i] + sampleBuffer[4][i];
			*sbRs = (*sbL) + (*sbRs);
			// inc ptr
			sbLs++;
			sbRs++;
			sbL++;
			sbR++;
		}
	}
}
 
int main(int argc, char *argv[])
 {
    WAVREAD_HANDLE *wav_in;
    WAVWRITE_HANDLE *wav_out;
	
	char WavInputName[256];
	char WavOutputName[256];
	
	DSPint nChannels;
	DSPint nChannelsOut = output_channels[processing_output_mode];
    DSPint bitsPerSample;
	DSPint sampleRate;
    DSPint iNumSamples;
    DSPint i;
    DSPint j;

    // Init channel buffers
   	// memset(&sampleBuffer[i],0,BLOCK_SIZE);
   	for (i = 0; i < MAX_NUM_CHANNEL; i++)
   	{
   		for (j = 0; i < MAX_NUM_CHANNEL; i++)
   		{
   			sampleBuffer[i][j] = FRACT_NUM(0);
   		}
   	}

   	// Open input wav file
	//-------------------------------------------------
	strcpy(WavInputName, argv[0]);
	wav_in = cl_wavread_open(WavInputName);
	 if(wav_in == NULL)
    {
        printf("Error: Could not open wavefile.\n");
        return -1;
    }
	//-------------------------------------------------
	
	// Read input wav header
	//-------------------------------------------------
	nChannels = cl_wavread_getnchannels(wav_in);
    bitsPerSample = cl_wavread_bits_per_sample(wav_in);
    sampleRate = cl_wavread_frame_rate(wav_in);
    iNumSamples =  cl_wavread_number_of_frames(wav_in);
	//-------------------------------------------------
	
	// Open output wav file
	//-------------------------------------------------
	strcpy(WavOutputName, argv[1]);
	wav_out = cl_wavwrite_open(WavOutputName, bitsPerSample, nChannelsOut, sampleRate);
	if(!wav_out)
    {
        printf("Error: Could not open wavefile.\n");
        return -1;
    }
	//-------------------------------------------------
	
	// Processing loop
	//-------------------------------------------------	
    {
		int k;
		int sample;
		
		// exact file length should be handled correctly...
		for(i=0; i<iNumSamples/BLOCK_SIZE; i++)
		{	
			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=0; k<nChannels; k++)
				{	
					sample = cl_wavread_recvsample(wav_in);
        			sampleBuffer[k][j] = rbits(sample);
				}
			}

			processing();

			for(j=0; j<BLOCK_SIZE; j++)
			{
				for(k=0; k<nChannelsOut; k++)
				{	
					sample = bitsr(sampleBuffer[k][j]);
					cl_wavwrite_sendsample(wav_out, sample);
				}
			}		
		}
	}
	
	// Close files
	//-------------------------------------------------	
    cl_wavread_close(wav_in);
    cl_wavwrite_close(wav_out);
	//-------------------------------------------------	

    return 0;
 }
