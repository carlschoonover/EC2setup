pemFile="/home/kruncheruser/current2.pem"
IPaddr="54.175.112.209"

highFile=$PWD'/'$(ls *.high.kwd)
kwikFile=$PWD'/'$(ls *.kwik)
kwxFile=$PWD'/'$(ls *.kwx)
logFile=$PWD'/'$(ls *.log)
lowFile=$PWD'/'$(ls *.low.kwd)
rawFile=$PWD'/'$(ls *.raw.kwd)
prbFile=$PWD'/'$(ls *.prb)
prmOutputFile=$PWD'/'$(ls *.txt)
prmFile=$PWD'/'$(ls *.prm)

fileNames=ls -d -1 $PWD/*.* | grep -v '.dat'

echo $fileNames

$scp -i $pemFile $PWD/* kruncheruser@$IPaddr:/mnt/data/fooData/