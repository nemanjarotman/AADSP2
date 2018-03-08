
#include <stdlib.h>
#include <string.h>
#include "WAVheader.h"
#include "fixed_point_math.h"
#include "stdfix_emu.h"
#include "common.h"


#define BLOCK_SIZE 16
#define MAX_NUM_CHANNEL 8

#define BUFFER_MAX_LENGTH 4000


DSPfract sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];
DSPfract* sampleBufferL = sampleBuffer[0];
DSPfract* sampleBufferR = sampleBuffer[1];
DSPfract* sampleBufferLS = sampleBuffer[3];
DSPfract* sampleBufferRS = sampleBuffer[4];
DSPfract* sampleBufferLFE = sampleBuffer[5];

DSPfract inputGain = FRACT_NUM(0.501187234);
DSPfract modeGain[] = { FRACT_NUM(0.0792446595), FRACT_NUM(0.250593617), FRACT_NUM(0.889139705), FRACT_NUM(0.7062687725) };			// >> 1		def: 0.16, 0.5, 1.78, 1.41
DSPint mode = 0;
DSPint output_mode[] = { 2,0,1 };
DSPint enable_main = 0;

DSPfract ratio = FRACT_NUM(0.05);
DSPfract threshold = FRACT_NUM(0.3);

DSPint outputChannelNum = 5;


static void gst_audio_dynamic_transform_compressor_float()
{
	DSPfract* p_l_fe;
	DSPfract val;
	DSPint i;
	DSPaccum tmp;

	p_l_fe = &sampleBuffer[LEFT_FE_CH][0];

	/* Nothing to do for us if ratio == 1.0. */
	if (ratio == FRACT_NUM(1.0))
		return;

	for (i = 0; i < BLOCK_SIZE; i++) 
	{		
		val = *p_l_fe;

		if (val > threshold)
		{
			//val = threshold + (val - threshold) * ratio;
			val = val - threshold;
			tmp = val * ratio;
			tmp = tmp + (threshold);										//sabiranje dva akumulatora ?
			val = (DSPfract)tmp;
		}
		else if (val < -threshold) 
		{
			//val = -threshold + (val + threshold) * ratio;
			val = val + threshold;
			tmp = val * ratio;
			tmp = tmp - (threshold);
			val = (DSPfract)tmp;
		}				
	}
	*p_l_fe = val;
	p_l_fe++;
}


void processing()
{
	DSPfract* p_l=sampleBufferL;
	DSPfract* p_r=sampleBufferR;
	DSPfract* p_l_fe=sampleBufferLFE;
	DSPfract* p_ls=sampleBufferLS;
	DSPfract* p_rs=sampleBufferRS;
	DSPint i;
	DSPaccum tmp1, tmp2;
	
	// INPUT GAIN
	p_l = &sampleBuffer[LEFT_CH][0];
	p_r = &sampleBuffer[RIGHT_CH][0];
	p_l_fe = &sampleBuffer[LEFT_FE_CH][0];

	for (i = 0; i < BLOCK_SIZE; i++) 
	{
		//*p_l = *p_l * inputGain;
		//*p_r = *p_r * inputGain;
		tmp1 = *p_l * inputGain;
		tmp2 = *p_r * inputGain;

		*p_l = (DSPfract)tmp1;
		*p_r = (DSPfract)tmp2;

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
			//*p_ls = *p_l * modeGain[0];						//probati direktno mode gain
			tmp1 = (DSPaccum)*p_l * ACCUM_NUM(0.0792446595);
			//*p_l_fe = *p_l_fe * modeGain[2];
			tmp2 = (DSPaccum)*p_l_fe * ACCUM_NUM(0.889139705);

			*p_ls = (DSPfract)tmp1;
			*p_l_fe = (DSPfract)tmp2;

			*p_ls << 1;					// << || <<=
			*p_l_fe << 1;

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
		*p_l = *p_ls + *p_l + *p_l_fe;		// sabiranje ?
		*p_rs = *p_r * FRACT_NUM(-1);
		
		p_l++;
		p_r++;
		p_ls++;
		p_rs++;
		p_l_fe++;
	}
}


DSPint main(DSPint argc, char* argv[])
{
	FILE *wav_in = NULL;
	FILE *wav_out = NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr, outputWAVhdr;

											// Init channel buffers
	for (DSPint i = 0; i < MAX_NUM_CHANNEL; i++)
	{
		for (DSPint j = 0; j < BLOCK_SIZE; j++)					// ZAGRADE
		{
			sampleBuffer[i][j] = FRACT_NUM(0.0);
		}
	}
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

	DSPint oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size / inputWAVhdr.fmt.NumChannels;
	DSPint oneChannelByteRate = inputWAVhdr.fmt.ByteRate / inputWAVhdr.fmt.NumChannels;
	DSPint oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign / inputWAVhdr.fmt.NumChannels;

	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign*outputWAVhdr.fmt.NumChannels;


	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out, outputWAVhdr);


	// Processing loop
	//-------------------------------------------------
	{
		DSPint sample;
		DSPint BytesPerSample = inputWAVhdr.fmt.BitsPerSample / 8;
		const double SAMPLE_SCALE = -(double)(1 << 31);		//2^31
		DSPint iNumSamples = inputWAVhdr.data.SubChunk2Size / (inputWAVhdr.fmt.NumChannels*inputWAVhdr.fmt.BitsPerSample / 8);

		// exact file length should be handled correctly...
		for (DSPint i = 0; i<iNumSamples / BLOCK_SIZE; i++)
		{
			for (DSPint j = 0; j<BLOCK_SIZE; j++)
			{
				for (DSPint k = 0; k<inputWAVhdr.fmt.NumChannels; k++)
				{
					sample = 0; //debug
					fread(&sample, BytesPerSample, 1, wav_in);
					sample = sample << (32 - inputWAVhdr.fmt.BitsPerSample); // force signextend
					sampleBuffer[k][j] = sample / SAMPLE_SCALE;				// scale sample to 1.0/-1.0 range
				}
			}


			if (enable_main == 0)
			{
				processing();
			}
			else
			{
				printf("Enable is turned OFF!\n");
			}

			for (DSPint j = 0; j<BLOCK_SIZE; j++)
			{
				for (DSPint k = 0; k<outputWAVhdr.fmt.NumChannels; k++)
				{
					sample = sampleBuffer[k][j].toLong();	// crude, non-rounding
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
