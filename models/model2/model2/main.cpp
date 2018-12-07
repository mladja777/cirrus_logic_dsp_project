
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "WAVheader.h"
#include "compressor.h"

#define BLOCK_SIZE 16
#define MAX_NUM_CHANNEL 8
#define PROJECT_RA44_CHANNEL_NUM 5

DSPfract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];

DSPint output_channels[] = { 2, 2, 5 };

DSPfract gain6db_scaled = FRACT_NUM(0.501187);
DSPfract gain2db_scaled = FRACT_NUM(0.794328);
DSPfract processing_input_gain = FRACT_NUM(0.501187);
DSPfract processing_headroom_gain = FRACT_NUM(0.707946);

bool processing_enable = true;

DSPint buffer_choice[3][5] = { { 0, 2, 0, 0, 0 }, { 3, 4, 0, 0, 0 }, { 0, 1, 2, 3, 4 } };

// Default processing compressor parameters for this project
DSPfract processing_compressor_threshold = FRACT_NUM(0.1);
DSPfract processing_compressor_ratio = FRACT_NUM(0.5);

AudioCompressor_t processing_audio_compressor;

enum processing_output_mode_t { MODE2_0_0, MODE0_2_0, MODE3_2_0 };
processing_output_mode_t processing_output_mode = MODE3_2_0;

// For mode020 all processing has to be done like mode320 \
//		because of 2 accumulations of L and R, and C is used \
//		for faster processing so function wouldn't write \
//		in L and R and just in C.
// For mode200 reduced processing has to be done.
void processing()
{
	// mode020
	if (processing_output_mode == MODE0_2_0)
	{
		DSPfract *sbL = sampleBuffer[0];
		DSPfract *sbC = sampleBuffer[1];
		DSPfract *sbR = sampleBuffer[2];

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
		DSPfract *sbL = sampleBuffer[0];
		DSPfract *sbC = sampleBuffer[1];
		DSPfract *sbR = sampleBuffer[2];
		DSPfract *sbLs = sampleBuffer[3];
		DSPfract *sbRs = sampleBuffer[4];
		DSPaccum tmp;

		DSPint i;
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*sbLs = (*sbL) * processing_input_gain;
			*sbRs = (*sbR) * processing_input_gain;
			tmp = *sbLs + *sbRs;
			*sbC = tmp;
			sbLs++;
			sbL++;
			sbRs++;
			sbR++;
			sbC++;
		}
		sbL = sampleBuffer[0];
		sbC = sampleBuffer[1];
		sbR = sampleBuffer[2];
		sbLs = sampleBuffer[3];
		sbRs = sampleBuffer[4];

		gst_audio_dynamic_transform_compressor_double(&processing_audio_compressor, sbLs, BLOCK_SIZE);
	
		gst_audio_dynamic_transform_compressor_double(&processing_audio_compressor, sbRs, BLOCK_SIZE);

		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*sbC = (*sbC) * processing_headroom_gain;
			sbC++;
		}
		sbC = sampleBuffer[1];

		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*sbL = (*sbC) * gain6db_scaled;
			*sbR = (*sbC) * gain6db_scaled;
			sbL++;
			sbR++;
			sbC++;
		}
		sbL = sampleBuffer[0];
		sbC = sampleBuffer[1];
		sbR = sampleBuffer[2];

		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*sbLs = (*sbLs) * gain2db_scaled;
			*sbRs = (*sbRs) * gain2db_scaled;
			sbLs++;
			sbRs++;
		}
		sbLs = sampleBuffer[3];
		sbRs = sampleBuffer[4];

		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*sbLs += *sbL;
			*sbRs = (*sbL) + (*sbRs);
			sbLs++;
			sbRs++;
			sbL++;
			sbR++;
		}
	}
}

DSPint main(DSPint argc, char* argv[])
{
	FILE *wav_in=NULL;
	FILE *wav_out=NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr,outputWAVhdr;	

	// Init channel buffers
	// memset(&sampleBuffer[i],0,BLOCK_SIZE);
	for (DSPint i = 0; i < MAX_NUM_CHANNEL; i++)
	{
		for (DSPint j = 0; i < MAX_NUM_CHANNEL; i++)
		{
			sampleBuffer[i][j] = FRACT_NUM(0);
		}
	}
		

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
			DSPint processing_gain_dB = atoi(argv[4]);
			double pig  = pow(10.0, (processing_gain_dB / 20.0));
			processing_input_gain = pig;

			if (argc > 5)
			{
				// Headroom gain argv[5]
				processing_gain_dB = atoi(argv[5]);
				double phg = pow(10.0, (processing_gain_dB / 20.0));
				processing_headroom_gain = phg;

				if (argc > 6)
				{
					// Mode argv[6]
					if (atoi(argv[6]) == 1)
					{
						processing_output_mode = MODE2_0_0;
					}
					else if (atoi(argv[6]) == 0)
					{
						processing_output_mode = MODE0_2_0;
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

	DSPint oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size/inputWAVhdr.fmt.NumChannels;
	DSPint oneChannelByteRate = inputWAVhdr.fmt.ByteRate/inputWAVhdr.fmt.NumChannels;
	DSPint oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign/inputWAVhdr.fmt.NumChannels;
	
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
		DSPint sample;
		DSPint BytesPerSample = inputWAVhdr.fmt.BitsPerSample/8;
		const double SAMPLE_SCALE = -(double)(1 << 31);		//2^31
		DSPint iNumSamples = inputWAVhdr.data.SubChunk2Size/(inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample/8);
		
		// exact file length should be handled correctly...
		for(DSPint i=0; i<iNumSamples/BLOCK_SIZE; i++)
		{	
			for(DSPint j=0; j<BLOCK_SIZE; j++)
			{
				for(DSPint k=0; k<inputWAVhdr.fmt.NumChannels; k++)
				{	
					sample = 0; //debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = FRACT_NUM(sample / SAMPLE_SCALE);				// scale sample to 1.0/-1.0 range		
				}
			}

			// processing();
			if (processing_enable)
			{
				processing();
			}

			for(DSPint j=0; j<BLOCK_SIZE; j++)
			{
				for(DSPint k=0; k<outputWAVhdr.fmt.NumChannels; k++)
				{	
					sample = sampleBuffer[buffer_choice[processing_output_mode][k]][j].toLong() ;	// crude, non-rounding 			
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample/8, 1, wav_out);		
				}
			}
			for (DSPint i = 0; i < MAX_NUM_CHANNEL; i++)
			{
				for (DSPint j = 0; i < MAX_NUM_CHANNEL; i++)
				{
					sampleBuffer[i][j] = FRACT_NUM(0);
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