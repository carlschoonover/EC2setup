pemFile=$(readlink -f $1)
IPaddr=$2
fileNames=$(ls -d -1 $PWD/*.* | grep -v '\.dat\|\.kwd')
scp -i $pemFile $fileNames kruncheruser@$IPaddr:/mnt/data/
