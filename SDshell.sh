paramFileName=$(ls *.prm)
outputFileName="${paramFileName%.*}_outputSD.txt"
experimentName=$(grep -F "experiment_name =" params.prm)
klusta $paramFileName --detect-only | tee $outputFileName
echo "$experimentName SpikeDetekt is done running" | mail -s "SD run completed" andrew.jp.fink@gmail.com ceschoonover@gmail.com
