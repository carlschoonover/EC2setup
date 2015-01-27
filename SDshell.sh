paramFileName=$(ls *.prm)
outputFileName="output_SD.txt"
experimentName=$(grep -F "experiment_name =" $paramFileName)
klusta $paramFileName --detect-only | tee $outputFileName
echo -e "$experimentName SpikeDetekt is done running\n\n$(tail -n 1 $outputFileName)" | mail -s "SD run completed on $(hostname)" andrew.jp.fink@gmail.com ceschoonover@gmail.com
