##############
### KLUSTA ###
##############
# Klusta:  https://github.com/klusta-team/klustaviewa/releases/
# Git:     https://github.com/klusta-team
cd ~/software
wget https://github.com/klusta-team/klustaviewa/releases/download/v0.3.0-rc1/klustaviewa-0.3.0.rc1.zip
unzip klustaviewa-0.3.0.rc1.zip 
# Might want to pul lthe latest SD2 from the Git, in which case also pull Kwiklib
cd ~/software/klustaviewa-0.3.0.rc1/
python setup.py install
