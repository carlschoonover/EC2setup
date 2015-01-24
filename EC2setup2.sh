##################
### CONDA VENV ###
##################
conda create -n klusta python=2.7 --yes
conda install -n klusta scipy pandas=0.12 pytables=3.0 pyqt setuptools pip cython nose ipython-notebook matplotlib --yes
conda install -n klusta numpy=1.8 --yes
source activate klusta
echo >> ~/.bashrc
echo source activate klusta >> ~/.bashrc
pip install pyopengl

##############
### KLUSTA ###
##############
# Klusta:  https://github.com/klusta-team/klustaviewa/releases/
# Git:     https://github.com/klusta-team
cd ~/software
wget https://github.com/klusta-team/klustaviewa/releases/download/v0.3.0-rc1/klustaviewa-0.3.0.rc1.zip
unzip klustaviewa-0.3.0.rc1.zip
rm klustaviewa-0.3.0.rc1.zip
# Pull the latest SD2 from the Git, and Kwiklib too
wget https://github.com/klusta-team/kwiklib/archive/master.zip
unzip master.zip 
rm master.zip
wget https://github.com/klusta-team/spikedetekt2/archive/master.zip
unzip master.zip 
rm master.zip
rm -R ~/software/klustaviewa-0.3.0.rc1/spikedetekt2/
rm -R ~/software/klustaviewa-0.3.0.rc1/kwiklib/
cp -R ~/software/spikedetekt2-master/spikedetekt2/ ~/software/klustaviewa-0.3.0.rc1/
cp -R ~/software/kwiklib-master/kwiklib/ ~/software/klustaviewa-0.3.0.rc1/
cd ~/software/klustaviewa-0.3.0.rc1/
python setup.py install

##################
### KLUSTAKWIK ###
##################
cd ~/software/
git clone https://github.com/klusta-team/klustakwik.git
cd ~/software/klustakwik/
############################## as of 1/14/15, i think openmp is in master branch
############################## git checkout unmaskedcov
make
mv KlustaKwik klustakwik 
echo >> ~/.bashrc
echo export PATH=\"$PWD/:\$PATH\" >> ~/.bashrc

########################
### MOUNT DATA DRIVE ###
########################
echo '### Mount data drive? ###'
read -p "[y/Y] or any key for no: " -n 1 -r
echo
if [[ $REPLY =~ ^[Yy]$ ]]
then
    diskName="xvdb"
    echo 'Assuming /dev/$diskName exists...'
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
fi

cd /mnt/data
wget https://raw.githubusercontent.com/carlschoonover/EC2setup/master/klustashell.sh
chmod u+x klustashell.sh
