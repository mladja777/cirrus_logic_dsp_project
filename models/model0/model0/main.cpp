
#include <stdlib.h>
#include <string.h>
#include <math.h>
#include "WAVheader.h"
#include "compressor.c"

#define BLOCK_SIZE 16
#define MAX_NUM_CHANNEL 8
#define PROJECT44_CHANNEL_NUM 5

double sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];

double gain6db_scaled = 0.501187;
double gain2db_scaled = 0.794328;
double processing_input_gain = 0.501187;
double processing_headroom_gain = 0.707946;

bool processing_enable = true;

// Default processing compressor parameters for this project
float processing_compressor_threshold = 0.5;
float processing_compressor_ratio = 0.5;

AudioCompressor_t processing_audio_compressor;

enum processing_output_mode_t { MODE2_0_0, MODE0_2_0, MODE3_2_0 };
processing_output_mode_t processing_output_mode = MODE2_0_0;

void processing()
{
	int i;
	for (i = 0; i < BLOCK_SIZE; i++) 
	{
		sampleBuffer[3][i] = sampleBuffer[0][i] * processing_input_gain;
		sampleBuffer[1][i] = sampleBuffer[0][i] * processing_input_gain + sampleBuffer[2][i] * processing_input_gain;
		sampleBuffer[4][i] = sampleBuffer[2][i] * processing_input_gain;
	}

	gst_audio_dynamic_transform_compressor_double(&processing_audio_compressor, sampleBuffer[3], BLOCK_SIZE);
	gst_audio_dynamic_transform_compressor_double(&processing_audio_compressor, sampleBuffer[4], BLOCK_SIZE);

	for (i = 0; i < BLOCK_SIZE; i++)
	{
		sampleBuffer[1][i] = sampleBuffer[1][i] * processing_headroom_gain;
	}

	for (i = 0; i < BLOCK_SIZE; i++)
	{
		sampleBuffer[0][i] = sampleBuffer[1][i] * gain6db_scaled;
		sampleBuffer[2][i] = sampleBuffer[1][i] * gain6db_scaled;
	}

	for (i = 0; i < BLOCK_SIZE; i++)
	{
		sampleBuffer[3][i] = sampleBuffer[0][i] * gain2db_scaled;
		sampleBuffer[4][i] = sampleBuffer[2][i] * gain2db_scaled;
	}

	for (i = 0; i < BLOCK_SIZE; i++)
	{
		sampleBuffer[3][i] = sampleBuffer[0][i] + sampleBuffer[3][i];
		sampleBuffer[4][i] = sampleBuffer[2][i] + sampleBuffer[4][i];
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
	
	// Set up output WAV header
	//-------------------------------------------------	
	outputWAVhdr = inputWAVhdr;
	outputWAVhdr.fmt.NumChannels = PROJECT44_CHANNEL_NUM; // change number of channels

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size/inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate/inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign/inputWAVhdr.fmt.NumChannels;
	
	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign*outputWAVhdr.fmt.NumChannels;

	// User input
	char usr_input_char;

	printf("\nChange input gain? (y/n): ");
	usr_input_char = getchar();
	if (usr_input_char == 'y')
	{
		printf("\nEnter input gain in dB: ");
		scanf("%ld", &processing_input_gain);
		processing_input_gain = pow(10.0, (processing_input_gain / 20));
	}
	fflush(stdin);
	printf("\nChange headroom gain? (y/n): ");
	usr_input_char = getchar();
	if (usr_input_char == 'y')
	{
		printf("\nEnter headroom gain in dB: ");
		scanf("%ld", &processing_headroom_gain);
		processing_headroom_gain = pow(10.0, (processing_headroom_gain/20));
	}
	fflush(stdin);
	printf("\nChange enable to off? (y/n): ");
	usr_input_char = getchar();
	if (usr_input_char == 'y')
	{
		processing_enable = false;
	}
	fflush(stdin);
	printf("\nChange output mode? (y/n): ");
	usr_input_char = getchar();
	if (usr_input_char == 'y')
	{
		printf("\nEnter desired mode (0 for 2_0_0, 1 for 0_2_0 or 2 for 3_2_0): ");
		scanf("%d", &processing_output_mode);
		if (processing_output_mode > 2)
		{
			processing_output_mode = MODE3_2_0;
		}
		else if (processing_output_mode < 0)
		{
			processing_output_mode = MODE2_0_0;
		}
	}
	fflush(stdin);

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

			//processing();

			for(int j=0; j<BLOCK_SIZE; j++)
			{
				for(int k=0; k<outputWAVhdr.fmt.NumChannels; k++)
				{	
					sample = sampleBuffer[k][j] * SAMPLE_SCALE ;	// crude, non-rounding 			
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