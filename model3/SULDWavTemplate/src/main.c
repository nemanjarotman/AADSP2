#include <stdio.h>
#include <dsplib\wavefile.h>
#include <stdfix.h>
#include <string.h>
#include "stdfix_emu.h"
#include "common.h"

#define BLOCK_SIZE 16
#define MAX_NUM_CHANNEL 8
#define BUFFER_MAX_LENGTH 4000]


#define LEFT_CH 0
#define RIGHT_CH 1
#define LEFT_S_CH 3
#define RIGHT_S_CH 4
#define LEFT_FE_CH 5


__memX fract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];

__memY DSPfract inputGain = FRACT_NUM(0.5);
__memY DSPaccum modeGain[] = { ACCUM_NUM(0.16), ACCUM_NUM(0.5), ACCUM_NUM(1.78), ACCUM_NUM(1.41) };
DSPint mode = 0;
DSPint output_mode[] = { 2,0,1 };
//DSPint enable_main = 0;

__memX DSPfract ratio = FRACT_NUM(0.05);
__memY DSPfract threshold = FRACT_NUM(0.3);


static void gst_audio_dynamic_transform_compressor_float()
{
	DSPfract val;
	DSPint i;

	__memX DSPfract* p_l_fe = &sampleBuffer[LEFT_FE_CH][0];

	/* Nothing to do for us if ratio == 1.0. */
	if (ratio == FRACT_NUM(1.0))
		return;

	for (i = 0; i < BLOCK_SIZE; i++)
	{
		val = *p_l_fe;

		if (threshold - val < 0)
		{
			val = threshold + (val - threshold) * ratio;
		}
		else if (val + threshold < 0)
		{
			val = (val + threshold) * ratio - threshold;
		}
		*p_l_fe = val;
		p_l_fe++;
	}
}


void processing()
{
	__memX DSPfract* p_l;
	__memX DSPfract* p_r;
	__memX DSPfract* p_l_fe;
	__memX DSPfract* p_ls;
	__memX DSPfract* p_rs;
	DSPint i;
	DSPaccum tmp1, tmp2;

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

	// MODE 0 or 1
	for (i = 0; i < BLOCK_SIZE; i++)
	{
		tmp1 = (DSPaccum)*p_l * modeGain[mode];
		tmp2 = (DSPaccum)*p_l_fe * modeGain[mode + 2];

		*p_ls = (DSPfract)tmp1;
		*p_l_fe = (DSPfract)tmp2;

		p_l++;
		p_ls++;
		p_l_fe++;
	}

	/*
	if (mode == 0)
	{
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			tmp1 = (DSPaccum)*p_l * modeGain[0];
			tmp2 = (DSPaccum)*p_l_fe * modeGain[2];

			*p_ls = (DSPfract)tmp1;
			*p_l_fe = (DSPfract)tmp2;

			p_l++;
			p_ls++;
			p_l_fe++;
		}
	}
	else
	{
		for (i = 0; i < BLOCK_SIZE; i++)
		{
			tmp1 = (DSPaccum)*p_l * modeGain[1];
			tmp2 = (DSPaccum)*p_l_fe * modeGain[3];

			*p_ls = (DSPfract)tmp1;
			*p_l_fe = (DSPfract)tmp2;

			p_l++;
			p_ls++;
			p_l_fe++;
		}
	}

*/
	// ADDER + NEGGER
	p_l = &sampleBuffer[LEFT_CH][0];
	p_r = &sampleBuffer[RIGHT_CH][0];
	p_ls = &sampleBuffer[LEFT_S_CH][0];
	p_rs = &sampleBuffer[RIGHT_S_CH][0];
	p_l_fe = &sampleBuffer[LEFT_FE_CH][0];

	for (i = 0; i < BLOCK_SIZE; i++)
	{
		*p_l = *p_ls + *p_l + *p_l_fe;
		*p_rs = *p_r * FRACT_NUM(-1);

		p_l++;
		p_r++;
		p_ls++;
		p_rs++;
		p_l_fe++;
	}
}


int main(int argc, char *argv[])
 {
    WAVREAD_HANDLE *wav_in;
    WAVWRITE_HANDLE *wav_out;
	
	char WavInputName[256];
	char WavOutputName[256];
	
    int nChannels;
	int bitsPerSample;
    int sampleRate;
    int iNumSamples;
    int i;
    int OutChannels = 8;

	// Init channel buffers
	for(i=0; i<MAX_NUM_CHANNEL; i++)
		memset(&sampleBuffer[i],0,BLOCK_SIZE);
    
	// Open input wav file
	//-------------------------------------------------
	strcpy(WavInputName,argv[0]);
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
	strcpy(WavOutputName,argv[1]);
	wav_out = cl_wavwrite_open(WavOutputName, bitsPerSample, OutChannels, sampleRate);
	if(!wav_out)
    {
        printf("Error: Could not open wavefile.\n");
        return -1;
    }
	//-------------------------------------------------
	
	// Processing loop
	//-------------------------------------------------	
    {
		int i;
		int j;
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
				for(k=0; k<OutChannels; k++)
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
