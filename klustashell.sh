paramFileName=$(ls *.prm)
outputFileName="${paramFileName%.*}_output.txt"
experimentName=$(grep -F "experiment_name =" params.prm)
klusta $paramFileName | tee $outputFileName
echo "$experimentName is done running" | mail -s "Run completed" andrew.jp.fink@gmail.com ceschoonover@gmail.com an11@columbia.edu