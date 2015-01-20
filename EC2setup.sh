################
### PACKAGES ###
################
sudo apt-get -y --force-yes update
sudo apt-get -y --force-yes install htop
sudo apt-get -y --force-yes install git
sudo apt-get -y --force-yes install build-essential 
sudo apt-get -y --force-yes install zip unzip
# sudo apt-get -y --force-yes install mailutils
# On 12/21/2014 there was a bug in klusta that meant it need an X11 server.
# If necessary, install X.
sudo apt-get -y --force-yes install xorg
sudo apt-get -y --force-yes install openbox

#######################
### PYTHON ANACONDA ###
#######################
mkdir ~/software
cd ~/software
wget http://repo.continuum.io/miniconda/Miniconda-3.7.0-Linux-x86_64.sh
bash -b Miniconda-3.7.0-Linux-x86_64.sh
