paramFileName=$(ls *.prm)
outputFileName="${paramFileName%.*}_outputKK.txt"
experimentName=$(grep -F "experiment_name =" params.prm)
klusta $paramFileName --cluster-only | tee $outputFileName
echo "$experimentName KlustaKwik is done running" | mail -s "Run completed" andrew.jp.fink@gmail.com ceschoonover@gmail.com