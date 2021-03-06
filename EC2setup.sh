sudo sed -i '1iforce_color_prompt=yes\n' ~/.bashrc

########################
### MOUNT DATA DRIVE ###
########################
echo '### Mount data drive? ###'
read -p "[y/Y] or any key for no: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    diskName="xvdb"
    echo 'Assuming /dev/'$diskName' exists...'
    # Check that SDD drive is there (will return size)
    sudo cat /sys/block/$diskName/queue/discard_max_bytes
    # Format the drive (mkfs format)
    sudo mkfs -t ext4 /dev/$diskName 
    # Mount the drive
    sudo mkdir /mnt/data
    sudo mount /dev/$diskName /mnt/data
    # Check if successful
    lsblk
    # df -h
    sudo chown -R $USER:$USER /mnt/data
    rm -R /mnt/data/lost+found/
fi

################
### PACKAGES ###
################
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes install htop
sudo apt-get -y --force-yes install git
sudo apt-get -y --force-yes install build-essential 
sudo apt-get -y --force-yes install zip unzip
sudo apt-get -y --force-yes install mailutils
# As of 12/21/2014 klusta install needs X11 even if running on a headless server.
sudo apt-get -y --force-yes install xorg
sudo apt-get -y --force-yes install openbox

#######################
### PYTHON ANACONDA ###
#######################
mkdir ~/software
cd ~/software
wget http://repo.continuum.io/miniconda/Miniconda-3.7.0-Linux-x86_64.sh
bash -b Miniconda-3.7.0-Linux-x86_64.sh

###########################
### OTHER SHELL SCRIPTS ###
###########################
cd ~/sh
git clone https://github.com/carlschoonover/EC2setup.git
mv ~/sh/EC2setup/*.sh ~/sh/
chmod u+x *.sh
cd ~/

chmod 400 ~/kruncher.pem

exec bash
