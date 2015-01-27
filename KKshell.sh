paramFileName=$(ls *.prm)
outputFileName="output_KK.txt"
experimentName=$(grep -F "experiment_name =" $paramFileName)
klusta $paramFileName --cluster-only | tee $outputFileName
echo "$experimentName KlustaKwik is done running" | mail -s "KK run completed on $(hostname)" andrew.jp.fink@gmail.com ceschoonover@gmail.com
