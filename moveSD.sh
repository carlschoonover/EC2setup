pemFile="~/current2.pem"
IPaddr="54.175.112.209"

prbFile=$PWD'/'$(ls *.prb)
logFile=$PWD'/'$(ls *.log)

echo $pemFile
echo $IPaddr
echo $prbFile
echo $logFile

# scp -i $pemFile $prbFile $logFile kruncheruser@$IPaddr:/mnt/data/fooData/