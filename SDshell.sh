paramFileName=$(ls *.prm)
outputFileName="output_SD.txt"
experimentName=$(grep -F "experiment_name =" $paramFileName)
klusta $paramFileName --detect-only | tee $outputFileName
echo "$experimentName SpikeDetekt is done running" | mail -s "SD run completed on $(hostname)" andrew.jp.fink@gmail.com ceschoonover@gmail.com
