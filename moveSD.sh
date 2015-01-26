pemFile=$(readlink -f $1)
IPaddr=$2
#IPaddr="54.175.112.209"


echo $pemFile

fileNames=$(ls -d -1 $PWD/*.* | grep -v '.dat')
#echo $fileNames

# scp -i $pemFile $fileNames kruncheruser@$IPaddr:/mnt/data/