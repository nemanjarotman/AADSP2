
#include <stdlib.h>
#include <string.h>
#include "WAVheader.h"

#define BLOCK_SIZE 16
#define MAX_NUM_CHANNEL 8
#define BUFEER_LENGTH 4000
#define NEG -1
#define LEFT_CH 0
#define RIGHT_CH 1
#define LEFT_CH_S 3
#define RIGHT_CH_S 4
#define LEFT_FE_CH 5


double sampleBuffer[MAX_NUM_CHANNEL][BLOCK_SIZE];

typedef struct{
	double* pBuffer;
	int bufferLength;
	double inputGain;
	double* modeGain;
	bool enable;
}control_struct_t;


typedef enum __characteristic
{
	CHARACTERISTICS_HARD_KNEE = 0,
	CHARACTERISTICS_SOFT_KNEE
} characteristic_t;


typedef struct __AudioCompressor
{
	int characteristics;
	float threshold;
	float ratio;
} AudioCompressor_t;

control_struct_t controlStruct;
characteristic_t characheristic;
AudioCompressor_t audioCompressor;

void control_struct_init(control_struct_t* Control_struct,double* p_Buffer, int buffer_Length, double input_Gain, double* mode_gain, bool enable){
	int i;
	for(i=0; i<buffer_Length;i++){
		
		p_Buffer[i]=0.0;
	}
	
	Control_struct->pBuffer=p_Buffer;
	Control_struct->bufferLength=buffer_Length;
	Control_struct->inputGain=input_Gain;
	Control_struct->modeGain=mode_gain;
	Control_struct->enable=enable;
}

void inputGain_f(double* bufferGain_i, double* bufferGain_o, int bufferLength, double gain){
	int i;
	for (i = 0; i < bufferLength; i++) {
		bufferGain_i[i]=bufferGain_i[i]*gain;
	}
}

void adder_f(double* input_buffer_A1, double* input_buffer_A2, double* input_buffer_A3, double* output_buffer_A, int buff_length_A){
	int i;
	for (i = 0; i < buff_length_A; i++) {
		output_buffer_A[i]=input_buffer_A1[i]+input_buffer_A2[i]+input_buffer_A3[i];
	}
}

void neg_f(double* input_buffer_N, double* output_buffer_N, int buff_length_N){
	int i;
	for(i=0;i<buff_length_N;i++){
		output_buffer_N[i]=input_buffer_N[i]*NEG;
	}
}

static void audio_compressor_init(AudioCompressor_t*  compressor)
{
	compressor->ratio = 1.0;
	compressor->threshold = 0.5;
	compressor->characteristics = CHARACTERISTICS_HARD_KNEE;
}

static void gst_audio_dynamic_transform_compressor_float(AudioCompressor_t *compressor, double* data, unsigned int num_samples)
{
	double val, threshold = compressor->threshold;
	int i;

	/* Nothing to do for us if ratio == 1.0. */
	if (compressor->ratio == 1.0)
		return;

	if (compressor->characteristics == CHARACTERISTICS_HARD_KNEE)
	{
		for (i = 0; i < num_samples; i++) {
			val = data[i];

			if (val > threshold) {
				val = threshold + (val - threshold) * compressor->ratio;
			}
			else if (val < -threshold) {
				val = -threshold + (val + threshold) * compressor->ratio;
			}
			data[i] = val;
		}

	}
	else{
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

		a_p = (1.0 - compressor->ratio) / (2.0 * (threshold - 1.0));
		b_p = (compressor->ratio * threshold - 1.0) / (threshold - 1.0);
		c_p = threshold * (1.0 - b_p - a_p * threshold);
		a_n = (1.0 - compressor->ratio) / (2.0 * (-threshold + 1.0));
		b_n = (-compressor->ratio * threshold + 1.0) / (-threshold + 1.0);
		c_n = -threshold * (1.0 - b_n + a_n * threshold);

		for (i = 0; i < num_samples; i++) {
			val = data[i];

			if (val > 1.0) {
				val = 1.0 + (val - 1.0) * compressor->ratio;
			}
			else if (val > threshold) {
				val = a_p * val * val + b_p * val + c_p;
			}
			else if (val < -1.0) {
				val = -1.0 + (val + 1.0) * compressor->ratio;
			}
			else if (val < -threshold) {
				val = a_n * val * val + b_n * val + c_n;
			}
			data[i] = val;
		}
	}
   
}

void processing(double input_gain,int mode,int output_mode, double* mode_gain,AudioCompressor_t* audioCompressor){

	int i;

	inputGain_f(sampleBuffer[LEFT_CH],sampleBuffer[LEFT_CH],BLOCK_SIZE,input_gain);
	inputGain_f(sampleBuffer[RIGHT_CH],sampleBuffer[RIGHT_CH],BLOCK_SIZE,input_gain);

	for (i = 0; i < BLOCK_SIZE; i++) {
		sampleBuffer[LEFT_FE_CH][i]=sampleBuffer[LEFT_CH][i];
	}

	gst_audio_dynamic_transform_compressor_float(audioCompressor,  sampleBuffer[LEFT_FE_CH], BLOCK_SIZE);

	if(mode==0){
		inputGain_f(sampleBuffer[LEFT_CH],sampleBuffer[LEFT_CH_S],BLOCK_SIZE,mode_gain[0]);
		inputGain_f(sampleBuffer[LEFT_FE_CH],sampleBuffer[LEFT_FE_CH],BLOCK_SIZE,mode_gain[2]);
	}else{
		inputGain_f(sampleBuffer[LEFT_CH],sampleBuffer[LEFT_CH_S],BLOCK_SIZE,mode_gain[1]);
		inputGain_f(sampleBuffer[LEFT_FE_CH],sampleBuffer[LEFT_FE_CH],BLOCK_SIZE,mode_gain[3]);
	}

	adder_f(sampleBuffer[LEFT_CH_S],sampleBuffer[LEFT_CH],sampleBuffer[LEFT_FE_CH],sampleBuffer[LEFT_CH],BLOCK_SIZE);
	neg_f(sampleBuffer[RIGHT_CH], sampleBuffer[RIGHT_CH_S], BLOCK_SIZE);
}

int main(int argc, char* argv[])
{
	FILE *wav_in=NULL;
	FILE *wav_out=NULL;
	char WavInputName[256];
	char WavOutputName[256];
	WAV_HEADER inputWAVhdr,outputWAVhdr;

	double mode_gain[]={0.16, 0.5, 1.78, 3};	
	double input_gain=0.5;
	bool enable=true;
	int mode=2;
	int output_mode[] = { 2,0,0 };



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
	outputWAVhdr.fmt.NumChannels = 5; // change number of channels

	int oneChannelSubChunk2Size = inputWAVhdr.data.SubChunk2Size/inputWAVhdr.fmt.NumChannels;
	int oneChannelByteRate = inputWAVhdr.fmt.ByteRate/inputWAVhdr.fmt.NumChannels;
	int oneChannelBlockAlign = inputWAVhdr.fmt.BlockAlign/inputWAVhdr.fmt.NumChannels;
	
	outputWAVhdr.data.SubChunk2Size = oneChannelSubChunk2Size*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.ByteRate = oneChannelByteRate*outputWAVhdr.fmt.NumChannels;
	outputWAVhdr.fmt.BlockAlign = oneChannelBlockAlign*outputWAVhdr.fmt.NumChannels;


	// Write output WAV header to file
	//-------------------------------------------------
	WriteWavHeader(wav_out,outputWAVhdr);
	control_struct_init(&controlStruct,*sampleBuffer,MAX_NUM_CHANNEL,input_gain, mode_gain, enable);
	audio_compressor_init(&audioCompressor); 
	
	

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
			if(enable==true){
				processing(input_gain,mode,*output_mode,mode_gain,&audioCompressor);
			}else{
				printf("Enable is false\n");
			}
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