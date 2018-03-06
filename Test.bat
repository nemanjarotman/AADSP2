: Delete log files first.
cd OutCmp
del output1_Model0_vs_Model1.txt

cd ..

: Execute Model 0, Model 1
cd model0
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Amp_Sweep.wav" "..//OutStreams//Out_Amp_Sweep.wav" 

cd ..

cd model1
cd Debug

: Generate new logs
"ProcesWavFile.exe" OutStreams//Amp_Sweep.wav OutStreams//Amp_Sweep.wav> OutCmp//.txt

:: TO DO: Compare output of model1 and model2 and store the result in OutCmp//whiteNoise_Model1_vs_Model2.txt


