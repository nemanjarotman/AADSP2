
#include <stdlib.h>
#include <string.h>
#include "WAVheader.h"

#define BLOCK_SIZE 16
#define MAX_NUM_CHANNEL 8

#define BUFFER_MAX_LENGTH 4000
#define NEG_VALUE -1

#define LEFT_CH 0
#define RIGHT_CH 1
#define LEFT_S_CH 3
#define RIGHT_S_CH 4
#define LEFT_FE_CH 5


double sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];
double inputGain = 0.501187234;
double modeGain[] = { 0.158489319, 0.501187234, 1.77827941, 1.412537545 };
int mode = 0;
int output_mode[] = { 2,0,1 };
bool enable_main = true;

double ratio = 0.05;
double threshold = 0.3;
int characteristics = 0;			//CHARACTERISTICS_HARD_KNEE


static void gst_audio_dynamic_transform_compressor_float()
{
	double* p_l_fe;
	double val;
	int i;

	p_l_fe = &sampleBuffer[LEFT_FE_CH][0];

	/* Nothing to do for us if ratio == 1.0. */
	if (ratio == 1.0)
		return;

	if (characteristics == 0)
	{
		for (i = 0; i < BLOCK_SIZE; i++) {
			
			val = *p_l_fe;

			if (val > threshold) {
				val = threshold + (val - threshold) * ratio;
			}
			else if (val < -threshold) {
				val = -threshold + (val + threshold) * ratio;
			}
			*p_l_fe = val;
			p_l_fe++;
		}

	}
	else 
	{
		double a_p, b_p, c_p;
		double a_n, b_n, c_n;

		/* We build a 2nd degree polynomial here for
		* values greater than threshold or small than
		* -threshold with:
		* f(t) = t, f'(t) = 1, f'(m) = r
		* =>
		* a = (1-r)/(2*(t-m))
		* b = (r*t - m)/(t-m)
		* c = t * (1 - b - a*t)
		* f(x) = ax^2 + bx + c
		*/

		/* If treshold is the same as the maximum
		* we need to raise it a bit to prevent
		* division by zero. */
		if (threshold == 1.0)
			threshold = 1.0 + 0.00001;

		a_p = (1.0 - ratio) / (2.0 * (threshold - 1.0));
		b_p = (ratio * threshold - 1.0) / (threshold - 1.0);
		c_p = threshold * (1.0 - b_p - a_p * threshold);
		a_n = (1.0 - ratio) / (2.0 * (-threshold + 1.0));
		b_n = (-ratio * threshold + 1.0) / (-threshold + 1.0);
		c_n = -threshold * (1.0 - b_n + a_n * threshold);

		for (i = 0; i < BLOCK_SIZE; i++) {
			val = *p_l_fe;

			if (val > 1.0) {
				val = 1.0 + (val - 1.0) * ratio;
			}
			else if (val > threshold) {
				val = a_p * val * val + b_p * val + c_p;
			}
			else if (val < -1.0) {
				val = -1.0 + (val + 1.0) * ratio;
			}
			else if (val < -threshold) {
				val = a_n * val * val + b_n * val + c_n;
			}
			*p_l_fe = val;
			p_l_fe++;
		}
	}
}


void processing()
{
	double* p_l;
	double* p_r;
	double* p_l_fe;
	double* p_ls;
	double* p_rs;
	int i;
	
	// INPUT GAIN
	p_l = &sampleBuffer[LEFT_CH][0];
	p_r = &sampleBuffer[RIGHT_CH][0];
	p_l_fe = &sampleBuffer[LEFT_FE_CH][0];

	for (i = 0; i < BLOCK_SIZE; i++) 
	{
		*p_l = *p_l * inputGain;
		*p_r = *p_r * inputGain;
		*p_l_fe = *p_l;

		p_l++;
		p_r++;
		p_l_fe++;
	}

	gst_audio_dynamic_transform_compressor_float();


	// MODE GAIN
	p_l = &sampleBuffer[LEFT_CH][0];
	p_ls = &sampleBuffer[LEFT_S_CH][0];
	p_l_fe = &sampleBuffer[LEFT_FE_CH][0];

	if (mode == 0)
	{
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			*p_ls = *p_l * modeGain[0];
			*p_l_fe = *p_l_fe * modeGain[2];

			p_l++;
			p_ls++;
			p_l_fe++;
		}
		
	}
	else
	{
		for (i = 0; i < BLOCK_SIZE; i++)
		{	
			*p_ls = *p_l * modeGain[1];
			*p_l_fe = *p_l_fe * modeGain[3];

			p_l++;
			p_ls++;
			p_l_fe++;
		}
	}


	// ADDER + NEGGER
	p_l = &sampleBuffer[LEFT_CH][0];
	p_r = &sampleBuffer[RIGHT_CH][0];
	p_ls = &sampleBuffer[LEFT_S_CH][0];
	p_rs = &sampleBuffer[RIGHT_S_CH][0];
	p_l_fe = &sampleBuffer[LEFT_FE_CH][0];

	for (i = 0; i < BLOCK_SIZE; i++)
	{	
		*p_l = *p_ls + *p_l + *p_l_fe;
		*p_rs = *p_r * NEG_VALUE;
		
		p_l++;
		p_r++;
		p_ls++;
		p_rs++;
		p_l_fe++;
	}
}


int main(int argc, char* argv[])
{
	FILE *wav_in = NULL;
	FILE *wav_out = NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr, outputWAVhdr;

											// Init channel buffers
	for (int i = 0; i<MAX_NUM_CHANNEL; i++)
		memset(&sampleBuffer[i], 0, BLOCK_SIZE);

	// Open input and output wav files
	//-------------------------------------------------
	strcpy(WavInputName, argv[1]);
	wav_in = OpenWavFileForRead(WavInputName, "rb");
	strcpy(WavOutputName, argv[2]);
	wav_out = OpenWavFileForRead(WavOutputName, "wb");
	//-------------------------------------------------

	// Read input wav header
	//-------------------------------------------------
	ReadWavHeader(wav_in, inputWAVhdr);
	//-------------------------------------------------

	// Set up output WAV header
	//-------------------------------------------------
	outputWAVhdr = inputWAVhdr;
	outputWAVhdr.fmt.NumChannels = 8; // change number of channels

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size / inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate / inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign / inputWAVhdr.fmt.NumChannels;

	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign*outputWAVhdr.fmt.NumChannels;


	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out, outputWAVhdr);


	// Processing loop
	//-------------------------------------------------
	{
		int sample;
		int BytesPerSample = inputWAVhdr.fmt.BitsPerSample / 8;
		const double SAMPLE_SCALE = -(double)(1 << 31);		//2^31
		int iNumSamples = inputWAVhdr.data.SubChunk2Size / (inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample / 8);

		// exact file length should be handled correctly...
		for (int i = 0; i<iNumSamples / BLOCK_SIZE; i++)
		{
			for (int j = 0; j<BLOCK_SIZE; j++)
			{
				for (int k = 0; k<inputWAVhdr.fmt.NumChannels; k++)
				{
					sample = 0; //debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = sample / SAMPLE_SCALE;				// scale sample to 1.0/-1.0 range
				}
			}


			if (enable_main == true)
			{
				processing();
			}
			else
			{
				printf("Enable is turned OFF!\n");
			}

			for (int j = 0; j<BLOCK_SIZE; j++)
			{
				for (int k = 0; k<outputWAVhdr.fmt.NumChannels; k++)
				{
					sample = sampleBuffer[k][j] * SAMPLE_SCALE;	// crude, non-rounding
					sample = sample >> (32 - inputWAVhdr.fmt.BitsPerSample);
					fwrite(&sample, outputWAVhdr.fmt.BitsPerSample / 8, 1, wav_out);
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
