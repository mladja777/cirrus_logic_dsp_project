/*
 *
 * This element can act as a dynamic range compressor. A compressor changes the
 * amplitude of all samples above a specific threshold with a specific ratio. If
 * soft-knee mode is selected the ratio is applied smoothly.
 *
 * parameters: ratio [0.0, 1.0)
 *             threshold [0.0, 1.0)
 */

#include "compressor.h"

void audio_compressor_init(AudioCompressor_t * compressor) {
	compressor->ratio = 1.0;
	compressor->threshold = 0.0;
}

void gst_audio_dynamic_transform_compressor_float(
		AudioCompressor_t * compressor, DSPfract * data, DSPint num_samples) {
	DSPfract val, threshold = compressor->threshold;
	int i;

	/* Nothing to do for us if ratio == 1.0. */
	if (compressor->ratio == FRACT_NUM(1.0))
		return;

	for (i = 0; i < num_samples; i++) {
		val = data[i];
		DSPfract negVal = val - threshold;
		DSPfract posVal = val + threshold;

		if (val > threshold) {
			val = threshold + negVal * compressor->ratio;
		} else if (val < -threshold) {
			val = -threshold + posVal * compressor->ratio;
		}
		data[i] = (DSPfract) val;
	}

}

// TODO: MAC
void gst_audio_dynamic_transform_compressor_double(AudioCompressor_t * compressor, DSPfract * data, DSPfract num_samples)
{
	DSPaccum val, threshold = compressor->threshold;
	int i;

	/* Nothing to do for us if ratio == 1.0. */
	if (compressor->ratio == FRACT_NUM(1.0))
		return;

	for (i = 0; i < num_samples; i++) {
		val = data[i];
		DSPfract negVal = val - threshold;
		DSPfract posVal = val + threshold;

		if (val > threshold) {
			val = threshold + negVal * compressor->ratio;
		}
		else if (val < -threshold) {
			val = -threshold + posVal * compressor->ratio;
		}
		data[i] = (DSPfract)val;
	}

}
