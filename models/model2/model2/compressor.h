#ifndef _H_COMPRESSOR
#define _H_COMPRESSOR

typedef struct __AudioCompressor {
	float threshold;
	float ratio;
} AudioCompressor_t;

void audio_compressor_init(AudioCompressor_t * compressor);
void gst_audio_dynamic_transform_compressor_float(AudioCompressor_t * compressor, float * data, unsigned int num_samples);
void gst_audio_dynamic_transform_compressor_double(AudioCompressor_t * compressor, double * data, unsigned int num_samples);

#endif // !_H_COMPRESSOR
