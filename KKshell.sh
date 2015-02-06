paramFileName=$(ls *.prm)
outputFileName="output_KK.txt"
experimentName=$(grep -F "experiment_name =" $paramFileName)

if [ $# -eq 0 ]
  then
    echo "Please define KK_Subset. (Syntax: \""KKshell.sh 50\"" for KK_Subset = 50)"
    exit 0
fi
sed '/KK_Subset = /c \KK_Subset = '$1 -i $paramFileName

klusta $paramFileName --cluster-only | tee $outputFileName
echo -e "$experimentName KlustaKwik is done running\n\n$(tail -n 1 $outputFileName)" | mail -s "KK run completed on $(hostname)" andrew.jp.fink@gmail.com ceschoonover@gmail.com
