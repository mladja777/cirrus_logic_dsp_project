#ifndef _H_COMPRESSOR
#define _H_COMPRESSOR

#include "stdfix_emu.h"
#include "common.h"

typedef struct __AudioCompressor {
	DSPfract threshold;
	DSPfract ratio;
} AudioCompressor_t;

void audio_compressor_init(__memX AudioCompressor_t * compressor);
void gst_audio_dynamic_transform_compressor_float(__memX AudioCompressor_t * compressor, __memY DSPfract * data, DSPint num_samples);
void gst_audio_dynamic_transform_compressor_double(__memX AudioCompressor_t * compressor, __memY DSPfract * data, DSPfract num_samples);

#endif // !_H_COMPRESSOR
