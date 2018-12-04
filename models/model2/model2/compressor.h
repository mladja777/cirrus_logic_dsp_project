#ifndef _H_COMPRESSOR
#define _H_COMPRESSOR

#include "fixed_point_math.h"
#include "stdfix_emu.h"
#include "common.h"

typedef struct __AudioCompressor {
	DSPfract threshold;
	DSPfract ratio;
} AudioCompressor_t;

void audio_compressor_init(AudioCompressor_t * compressor);
void gst_audio_dynamic_transform_compressor_float(AudioCompressor_t * compressor, DSPfract * data, DSPint num_samples);
void gst_audio_dynamic_transform_compressor_double(AudioCompressor_t * compressor, DSPfract * data, DSPfract num_samples);

#endif // !_H_COMPRESSOR
