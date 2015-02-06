# Get filenames and parameters
paramFileName=$(ls *.prm)
outputFileName="output_KK.txt"
experimentName=$(grep -F "experiment_name =" $paramFileName)

# Set user-specified KK_Subset or halt if not entered
if [ $# -eq 0 ]
  then
    echo "Please define KK_Subset. (Syntax: \""KKshell.sh 50\"" for KK_Subset = 50)"
    exit 0
fi
sed '/KK_Subset = /c \KK_Subset = '$1 -i $paramFileName

# Run KlustaKwik
klusta $paramFileName --cluster-only | tee $outputFileName
mv _klustakwik _klustakwik-subset$1

# Send confirmation email once all is done
echo -e "$experimentName KlustaKwik KK_Subset $1 is done running\n\n$(tail -n 1 $outputFileName)" | mail -s "KlustaKwik KK_Subset $1 run completed on $(hostname)" andrew.jp.fink@gmail.com ceschoonover@gmail.com
