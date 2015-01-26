sudo sed -i '1iforce_color_prompt=yes\n' ~/.bashrc

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

########################
### PULL NEXT SCRIPT ###
########################
cd ~/sh/
wget https://raw.githubusercontent.com/carlschoonover/EC2setup/master/EC2setup2.sh
chmod u+x EC2setup2.sh
cd ~/
exec bash
