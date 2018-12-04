
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "WAVheader.h"
#include "compressor.h"

#define BLOCK_SIZE 16
#define MAX_NUM_CHANNEL 8
#define PROJECT_RA44_CHANNEL_NUM 5

double sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];

int output_channels[] = { 2, 2, 5 };

double gain6db_scaled = 0.501187;
double gain2db_scaled = 0.794328;
double processing_input_gain = 0.501187;
double processing_headroom_gain = 0.707946;

bool processing_enable = true;

/*
int MODE2_0_0_buffer_choice[] = { 0, 2, 0, 0, 0 };
int MODE0_2_0_buffer_choice[] = { 3, 4, 0, 0, 0 };
int MODE3_2_0_buffer_choice[] = { 0, 1, 2, 3, 4 };
*/

int buffer_choice[3][5] = { { 0, 2, 0, 0, 0 }, { 3, 4, 0, 0, 0 }, { 0, 1, 2, 3, 4 } };

// Default processing compressor parameters for this project
float processing_compressor_threshold = 0.1;
float processing_compressor_ratio = 0.5;

AudioCompressor_t processing_audio_compressor;

enum processing_output_mode_t { MODE2_0_0, MODE0_2_0, MODE3_2_0 };
processing_output_mode_t processing_output_mode = MODE3_2_0;

// TODO Monday: indexing with pointers. --> DONE.
// For mode020 all processing has to be done like mode320 \
//		because of 2 accumulations of L and R, and C is used \
//		for faster processing so function wouldn't write \
//		in L and R and just in C.
// For mode200 reduced processing has to be done.
// TODO: fixed point.
void processing()
{
	// mode020
	if (processing_output_mode == MODE0_2_0)
	{
		double *sbL = sampleBuffer[0];
		double *sbC = sampleBuffer[1];
		double *sbR = sampleBuffer[2];

		int i;
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*sbC = (*sbL) * processing_input_gain + (*sbR) * processing_input_gain;
			sbR++;
			sbR++;
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
		double *sbL = sampleBuffer[0];
		double *sbC = sampleBuffer[1];
		double *sbR = sampleBuffer[2];
		double *sbLs = sampleBuffer[3];
		double *sbRs = sampleBuffer[4];

		int i;
		// TODO: ASM hw loop --> optimized.
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			// sampleBuffer[3][i] = sampleBuffer[0][i] * processing_input_gain;
			*sbLs = (*sbL) * processing_input_gain;
			// sampleBuffer[4][i] = sampleBuffer[2][i] * processing_input_gain;
			*sbRs = (*sbR) * processing_input_gain;
			// sampleBuffer[1][i] = sampleBuffer[3][i] + sampleBuffer[4][i];
			*sbC = (*sbLs) + (*sbRs);
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

		// TODO: ASM hw loop
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

		// TODO: ASM hw loop
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
			*sbLs = (*sbL) + (*sbLs);
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

int main(int argc, char* argv[])
{
	FILE *wav_in=NULL;
	FILE *wav_out=NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr,outputWAVhdr;	

	// Init channel buffers
	for(int i=0; i<MAX_NUM_CHANNEL; i++)
		memset(&sampleBuffer[i],0,BLOCK_SIZE);

	// Open input and output wav files
	//-------------------------------------------------
	strcpy(WavInputName,argv[1]);
	wav_in = OpenWavFileForRead (WavInputName,"rb");
	strcpy(WavOutputName,argv[2]);
	wav_out = OpenWavFileForRead (WavOutputName,"wb");
	//-------------------------------------------------

	// Read input wav header
	//-------------------------------------------------
	ReadWavHeader(wav_in,inputWAVhdr);
	//-------------------------------------------------
	// Set data from command line
	//-------------------------------------------------

	if (argc > 3)
	{
		// Enable argv[3]
		processing_enable = atoi(argv[3]);

		if (argc > 4)
		{
			// Input gain argv[4]
			int processing_gain_dB = atoi(argv[4]);
			processing_input_gain = pow(10.0, (processing_gain_dB / 20.0));

			if (argc > 5)
			{
				// Headroom gain argv[5]
				processing_gain_dB = atoi(argv[5]);
				processing_headroom_gain = pow(10.0, (processing_gain_dB / 20.0));

				if (argc > 6)
				{
					// Mode argv[6]
					if (atoi(argv[6]) == 1)
					{
						processing_output_mode = MODE0_2_0;
					}
					else if (atoi(argv[6]) == 0)
					{
						processing_output_mode = MODE2_0_0;
					}	// Else is default
				}
			}
		}
	}

	//-------------------------------------------------
	// Set up output WAV header
	//-------------------------------------------------	
	outputWAVhdr = inputWAVhdr;
	// change number of channels
	outputWAVhdr.fmt.NumChannels = output_channels[processing_output_mode];

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size/inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate/inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign/inputWAVhdr.fmt.NumChannels;
	
	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign*outputWAVhdr.fmt.NumChannels;

	processing_audio_compressor.threshold = processing_compressor_threshold;
	processing_audio_compressor.ratio = processing_compressor_ratio;

	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out,outputWAVhdr);


	// Processing loop
	//-------------------------------------------------	
	{
		int sample;
		int BytesPerSample = inputWAVhdr.fmt.BitsPerSample/8;
		const double SAMPLE_SCALE = -(double)(1 << 31);		//2^31
		int iNumSamples = inputWAVhdr.data.SubChunk2Size/(inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample/8);
		
		// exact file length should be handled correctly...
		for(int i=0; i<iNumSamples/BLOCK_SIZE; i++)
		{	
			for(int j=0; j<BLOCK_SIZE; j++)
			{
				for(int k=0; k<inputWAVhdr.fmt.NumChannels; k++)
				{	
					sample = 0; //debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = sample / SAMPLE_SCALE;				// scale sample to 1.0/-1.0 range		
				}
			}

			for (int k = 0; k < BLOCK_SIZE; k++)
			{
				sampleBuffer[2][k] = sampleBuffer[1][k];
				sampleBuffer[1][k] = 0;
			}

			// processing();
			if (processing_enable)
			{
				processing();
			}

			for(int j=0; j<BLOCK_SIZE; j++)
			{
				for(int k=0; k<outputWAVhdr.fmt.NumChannels; k++)
				{	
					sample = sampleBuffer[buffer_choice[processing_output_mode][k]][j] * SAMPLE_SCALE ;	// crude, non-rounding 			
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);		
				}
			}		
		}
	}
	
	// Close files
	//-------------------------------------------------	
	fclose(wav_in);
	fclose(wav_out);
	//-------------------------------------------------	

	return 0;
}