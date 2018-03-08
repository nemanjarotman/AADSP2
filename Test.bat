: Delete log files first.
cd OutCmp
del Out_Amp_Sweep_Model0_vs_Model1.txt
del Out_Amp_Sweep_Model1_vs_Model2.txt



cd ..

: Execute Model 0, Model 1
cd model0
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Amp_Sweep.wav" "..//..//OutStreams//Out_Amp_Sweep_model0.wav" 

cd ..
cd ..
cd model1
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Amp_Sweep.wav" "..//..//OutStreams//Out_Amp_Sweep_model1.wav" 

cd ..
cd ..
cd model2
cd Debug
"ProcessWavFile.exe" "..//..//TestStreams//Amp_Sweep.wav" "..//..//OutStreams//Out_Amp_Sweep_model2.wav"

::c:\CirrusDSP\bin\cmdline_simulator.exe -project multitapEcho_model3//SimulatorConfigurationTemp.sbr -max_cycles 1000000
cd ..
cd ..

: Generate new logs
"tools//PCMCompare.exe" OutStreams//Out_Amp_Sweep_model0.wav OutStreams//Out_Amp_Sweep_model1.wav 2> OutCmp//Out_Amp_Sweep_Model0_vs_Model1.txt
"tools//PCMCompare.exe" OutStreams//Out_Amp_Sweep_model1.wav OutStreams//Out_Amp_Sweep_model2.wav 2> OutCmp//Out_Amp_Sweep_Model1_vs_Model2.txt