/*
 *
 * This element can act as a dynamic range compressor. A compressor changes the
 * amplitude of all samples above a specific threshold with a specific ratio. If
 * soft-knee mode is selected the ratio is applied smoothly.
 *
 * parameters: ratio [0.0, 1.0)
 *             threshold [0.0, 1.0)
 */

#include <compressor.h>

void audio_compressor_init(__memX AudioCompressor_t * compressor) {
	compressor->ratio = FRACT_NUM(1.0);
	compressor->threshold = FRACT_NUM(0.0);
}

void gst_audio_dynamic_transform_compressor_float(
		__memX AudioCompressor_t * compressor, __memY DSPfract * data, DSPint num_samples) {
	DSPfract val, threshold = compressor->threshold;
	int i;
	DSPfract negVal;
	DSPfract posVal;

	/* Nothing to do for us if ratio == 1.0. */
	if (compressor->ratio == FRACT_NUM(1.0))
		return;

	for (i = 0; i < num_samples; i++) {
		val = data[i];
		negVal = val - threshold;
		posVal = val + threshold;

		if (val > threshold) {
			val = negVal * compressor->ratio;
			val = val + threshold;
		} else if (val < -threshold) {
			val = posVal * compressor->ratio;
			val = val - threshold;
		}
		data[i] = (DSPfract) val;
	}

}

// TODO: MAC
void gst_audio_dynamic_transform_compressor_double(__memX AudioCompressor_t * compressor, __memY DSPfract * data, DSPfract num_samples)
{
	DSPaccum val, threshold = compressor->threshold;
	int i;
	DSPfract negVal;
	DSPfract posVal;

	/* Nothing to do for us if ratio == 1.0. */
	if (compressor->ratio == FRACT_NUM(1.0))
		return;

	for (i = 0; i < num_samples; i++) {
		val = data[i];
		negVal = val - threshold;
		posVal = val + threshold;

		if (val > threshold) {
			val = negVal * compressor->ratio;
			val = val + threshold;
		}
		else if (val < -threshold) {
			val = posVal * compressor->ratio;
			val = val - threshold;
		}
		data[i] = (DSPfract)val;
	}

}