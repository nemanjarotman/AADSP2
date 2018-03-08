: Delete log files first.
cd OutCmp
del Out_Amp_Sweep_Model0_vs_Model1.txt
del Out_Amp_Sweep_Model1_vs_Model2.txt

cd ..

: Execute Model 0, Model 1 and Model 3 with 2ch_contour_ne40_24b_48k stream
cd model0
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//2ch_contour_ne40_24b_48k.wav" "..//..//OutStreams//2ch_contour_ne40_24b_48k.wav" 
cd ..
cd ..
cd model1
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//2ch_contour_ne40_24b_48k.wav" "..//..//OutStreams//2ch_contour_ne40_24b_48k.wav"
cd ..
cd ..
cd model2
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//2ch_contour_ne40_24b_48k.wav" "..//..//OutStreams//2ch_contour_ne40_24b_48k.wav"
cd ..
cd ..

: Execute Model 0, Model 1 and Model 3 with 2ch_lvl_amt_48k stream
cd model0
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//2ch_lvl_amt_48k.wav" "..//..//OutStreams//2ch_lvl_amt_48k.wav" 
cd ..
cd ..
cd model1
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//2ch_lvl_amt_48k.wav" "..//..//OutStreams//2ch_lvl_amt_48k.wav"
cd ..
cd ..
cd model2
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//2ch_lvl_amt_48k.wav" "..//..//OutStreams//2ch_lvl_amt_48k.wav"
cd ..
cd ..

: Execute Model 0, Model 1 and Model 3 with Amp_Sweep stream
cd model0
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Amp_Sweep.wav" "..//..//OutStreams//Amp_Sweep.wav" 
cd ..
cd ..
cd model1
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Amp_Sweep.wav" "..//..//OutStreams//Amp_Sweep.wav"
cd ..
cd ..
cd model2
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Amp_Sweep.wav" "..//..//OutStreams//Amp_Sweep.wav"
cd ..
cd ..

: Execute Model 0, Model 1 and Model 3 with Freq_sweep stream
cd model0
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Freq_sweep.wav" "..//..//OutStreams//Freq_sweep.wav" 
cd ..
cd ..
cd model1
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Freq_sweep.wav" "..//..//OutStreams//Freq_sweep.wav"
cd ..
cd ..
cd model2
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Freq_sweep.wav" "..//..//OutStreams//Freq_sweep.wav"
cd ..
cd ..

: Execute Model 0, Model 1 and Model 3 with Multi_Tone stream
cd model0
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Multi_Tone.wav" "..//..//OutStreams//Multi_Tone.wav" 
cd ..
cd ..
cd model1
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Multi_Tone.wav" "..//..//OutStreams//Multi_Tone.wav"
cd ..
cd ..
cd model2
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Multi_Tone.wav" "..//..//OutStreams//Multi_Tone.wav"
cd ..
cd ..

: Execute Model 0, Model 1 and Model 3 with out stream
cd model0
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//out.wav" "..//..//OutStreams//out.wav" 
cd ..
cd ..
cd model1
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//out.wav" "..//..//OutStreams//out.wav"
cd ..
cd ..
cd model2
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//out.wav" "..//..//OutStreams//out.wav"
cd ..
cd ..

: Execute Model 0, Model 1 and Model 3 with out_multi_tone stream
cd model0
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//out_multi_tone.wav" "..//..//OutStreams//out_multi_tone.wav" 
cd ..
cd ..
cd model1
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//out_multi_tone.wav" "..//..//OutStreams//out_multi_tone.wav"
cd ..
cd ..
cd model2
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//out_multi_tone.wav" "..//..//OutStreams//out_multi_tone.wav"
cd ..
cd ..

: Execute Model 0, Model 1 and Model 3 with Test3_WMA_v9_1pCBR_320kbps_48Khz_2 stream
cd model0
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Test3_WMA_v9_1pCBR_320kbps_48Khz_2.wav" "..//..//OutStreams//Test3_WMA_v9_1pCBR_320kbps_48Khz_2.wav" 
cd ..
cd ..
cd model1
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Test3_WMA_v9_1pCBR_320kbps_48Khz_2.wav" "..//..//OutStreams//Test3_WMA_v9_1pCBR_320kbps_48Khz_2.wav"
cd ..
cd ..
cd model2
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Test3_WMA_v9_1pCBR_320kbps_48Khz_2.wav" "..//..//OutStreams//Test3_WMA_v9_1pCBR_320kbps_48Khz_2.wav"
cd ..
cd ..

: Execute Model 0, Model 1 and Model 3 with titanic_horn stream

cd model0
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//titanic_horn.wav" "..//..//OutStreams//titanic_horn.wav" 
cd ..
cd ..
cd model1
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//titanic_horn.wav" "..//..//OutStreams//titanic_horn.wav"
cd ..
cd ..
cd model2
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//titanic_horn.wav" "..//..//OutStreams//titanic_horn.wav"
cd ..
cd ..

: Execute Model 0, Model 1 and Model 3 with Tone_L1k_R3k stream

cd model0
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Tone_L1k_R3k.wav" "..//..//OutStreams//Tone_L1k_R3k.wav" 
cd ..
cd ..
cd model1
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Tone_L1k_R3k.wav" "..//..//OutStreams//Tone_L1k_R3k.wav"
cd ..
cd ..
cd model2
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Tone_L1k_R3k.wav" "..//..//OutStreams//Tone_L1k_R3k.wav"
cd ..
cd ..

: Execute Model 0, Model 1 and Model 3 with WhiteNoise stream

cd model0
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//WhiteNoise.wav" "..//..//OutStreams//WhiteNoise.wav" 
cd ..
cd ..
cd model1
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//WhiteNoise.wav" "..//..//OutStreams//WhiteNoise.wav"
cd ..
cd ..
cd model2
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//WhiteNoise.wav" "..//..//OutStreams//WhiteNoise.wav"
cd ..
cd ..

: Generate new logs
: 2ch_contour_ne40_24b_48k
echo model0 vs model1: >> OutCmp//out_2ch_contour_model0_vs_model1.txt
"tools//PCMCompare.exe" OutStreams//out_2ch_contour_ne40_24b_48k_model0.wav OutStreams//out_2ch_contour_ne40_24b_48k_model1.wav >> OutCmp//out_2ch_contour_model0_vs_model1.txt
echo model1 vs model2: >> OutCmp//out_2ch_contour_model1_vs_model2.txt
"tools//PCMCompare.exe" OutStreams//out_2ch_contour_ne40_24b_48k_model1.wav OutStreams//out_2ch_contour_ne40_24b_48k_model2.wav >> OutCmp//out_2ch_contour_model1_vs_model2.txt


: 2ch_contour_ne40_24b_48k
echo model0 vs model1: >> OutCmp//out_2ch_lvl_amt_48k_model0_vs_model1.txt
"tools//PCMCompare.exe" OutStreams//out_2ch_lvl_amt_48k_model0.wav OutStreams//out_2ch_lvl_amt_48k_model1.wav >> OutCmp//out_2ch_lvl_amt_48k_model0_vs_model1.txt
echo model1 vs model2: >> OutCmp//out_2ch_lvl_amt_48k_model1_vs_model2.txt
"tools//PCMCompare.exe" OutStreams//out_2ch_lvl_amt_48k_model1.wav OutStreams//out_2ch_lvl_amt_48k_model2.wav >> OutCmp//out_2ch_lvl_amt_48k_model1_vs_model2.txt

: Amp_Sweep
echo model0 vs model1: >> OutCmp//out_Amp_Sweep_model0_vs_model1.txt
"tools//PCMCompare.exe" OutStreams//out_Amp_Sweep.wav OutStreams//out_Amp_Sweep_model1.wav >> OutCmp//out_Amp_Sweep_model0_vs_model1.txt
echo model1 vs model2: >> OutCmp//out_Amp_Sweep_model1_vs_model2.txt
"tools//PCMCompare.exe" OutStreams//out_Amp_Sweep_model1.wav OutStreams//out_Amp_Sweep_model2.wav >> OutCmp//out_Amp_Sweep_model1_vs_model2.txt

: Freq_sweep
echo model0 vs model1: >> OutCmp//out_Freq_sweep_model0_vs_model1.txt
"tools//PCMCompare.exe" OutStreams//out_Freq_sweep.wav OutStreams//out_Freq_sweep_model1.wav >> OutCmp//out_Freq_sweep_model0_vs_model1.txt
echo model1 vs model2: >> OutCmp//out_Freq_sweep_model1_vs_model2.txt
"tools//PCMCompare.exe" OutStreams//out_Freq_sweep_model1.wav OutStreams//out_Freq_sweep_model2.wav >> OutCmp//out_Freq_sweep_model1_vs_model2.txt

: Multi_Tone
echo model0 vs model1: >> OutCmp//out_Multi_Tone_model0_vs_model1.txt
"tools//PCMCompare.exe" OutStreams//out_Multi_Tone.wav OutStreams//out_Multi_Tone_model1.wav >> OutCmp//out_Multi_Tone_model0_vs_model1.txt
echo model1 vs model2: >> OutCmp//out_Multi_Tone_model1_vs_model2.txt
"tools//PCMCompare.exe" OutStreams//out_Multi_Tone_model1.wav OutStreams//out_Multi_Tone_model2.wav >> OutCmp//out_Multi_Tone_model1_vs_model2.txt

: out
echo model0 vs model1: >> OutCmp//out_out_model0_vs_model1.txt
"tools//PCMCompare.exe" OutStreams//out_out.wav OutStreams//out_out_model1.wav >> OutCmp//out_out_model0_vs_model1.txt
echo model1 vs model2: >> OutCmp//out_out_model1_vs_model2.txt
"tools//PCMCompare.exe" OutStreams//out_out_model1.wav OutStreams//out_out_model2.wav >> OutCmp//out_out_model1_vs_model2.txt

: out_multi_tone
echo model0 vs model1: >> OutCmp//out_out_multi_tone_model0_vs_model1.txt
"tools//PCMCompare.exe" OutStreams//out_out_multi_tone.wav OutStreams//out_out_multi_tone_model1.wav >> OutCmp//out_out_multi_tone_model0_vs_model1.txt
echo model1 vs model2: >> OutCmp//out_out_multi_tone_model1_vs_model2.txt
"tools//PCMCompare.exe" OutStreams//out_out_multi_tone_model1.wav OutStreams//out_out_multi_tone_model2.wav >> OutCmp//out_out_multi_tone_model1_vs_model2.txt

: Test3_WMA_v9_1pCBR_320kbps_48Khz_2
echo model0 vs model1: >> OutCmp//out_Test3_WMA_v9_1pCBR_320kbps_48Khz_2_model0_vs_model1.txt
"tools//PCMCompare.exe" OutStreams//out_Test3_WMA_v9_1pCBR_320kbps_48Khz_2.wav OutStreams//out_Test3_WMA_v9_1pCBR_320kbps_48Khz_2_model1.wav >> OutCmp//out_Test3_WMA_v9_1pCBR_320kbps_48Khz_2_model0_vs_model1.txt
echo model1 vs model2: >> OutCmp//out_Test3_WMA_v9_1pCBR_320kbps_48Khz_2_model1_vs_model2.txt
"tools//PCMCompare.exe" OutStreams//out_out_Test3_WMA_v9_1pCBR_320kbps_48Khz_2_model1.wav OutStreams//out_Test3_WMA_v9_1pCBR_320kbps_48Khz_2_model2.wav >> OutCmp//out_Test3_WMA_v9_1pCBR_320kbps_48Khz_2_model1_vs_model2.txt

: titanic_horn
echo model0 vs model1: >> OutCmp//out_titanic_horn_model0_vs_model1.txt
"tools//PCMCompare.exe" OutStreams//out_titanic_horn.wav OutStreams//out_titanic_horn_model1.wav >> OutCmp//out_titanic_horn_model0_vs_model1.txt
echo model1 vs model2: >> OutCmp//out_titanic_horn_model1_vs_model2.txt
"tools//PCMCompare.exe" OutStreams//out_titanic_horn_model1.wav OutStreams//out_titanic_horn_model2.wav >> OutCmp//out_titanic_horn_model1_vs_model2.txt

: Tone_L1k_R3k
echo model0 vs model1: >> OutCmp//out_Tone_L1k_R3k_model0_vs_model1.txt
"tools//PCMCompare.exe" OutStreams//out_Tone_L1k_R3k.wav OutStreams//out_Tone_L1k_R3k_model1.wav >> OutCmp//out_Tone_L1k_R3k_model0_vs_model1.txt
echo model1 vs model2: >> OutCmp//out_Tone_L1k_R3k_model1_vs_model2.txt
"tools//PCMCompare.exe" OutStreams//out_Tone_L1k_R3k_model1.wav OutStreams//out_Tone_L1k_R3k_model2.wav >> OutCmp//out_Tone_L1k_R3k_model1_vs_model2.txt

: titanic_horn
echo model0 vs model1: >> OutCmp//out_WhiteNoise_model0_vs_model1.txt
"tools//PCMCompare.exe" OutStreams//out_WhiteNoise.wav OutStreams//out_WhiteNoise_model1.wav >> OutCmp//out_WhiteNoise_model0_vs_model1.txt
echo model1 vs model2: >> OutCmp//out_WhiteNoise_model1_vs_model2.txt
"tools//PCMCompare.exe" OutStreams//out_WhiteNoise_model1.wav OutStreams//out_WhiteNoise_model2.wav >> OutCmp//out_WhiteNoise_model1_vs_model2.txt











