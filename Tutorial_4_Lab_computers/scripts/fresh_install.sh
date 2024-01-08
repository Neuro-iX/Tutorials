######
# VScode 
######

wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O /tmp/code_latest_amd64.deb
dpkg -i /tmp/code_latest_amd64.deb
rm /tmp/code_latest_amd64.deb
#'code' in terminal

######
# Globus : https://docs.globus.org/globus-connect-personal/install/linux/
######

(sleep 10; echo Y) | apt-get install tk tcllib #Prerequisite
wget 'https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz' -O /tmp/globusconnectpersonal-latest.tgz
tar xzf /tmp/globusconnectpersonal-latest.tgz -C /usr/bin

# bash /usr/bin/globusconnectpersonal*/globusconnectpersonal
#Existing organizational login: Compute Canada
#Use CCDB login info
#Create new collection (corresponding to you desktop)

######
# Discord
######

wget "https://discord.com/api/download?platform=linux&format=deb" -O /tmp/latest-discord.deb
dpkg -i /tmp/latest-discord.deb
rm /tmp/latest-discord.deb
#'discord' in terminal

######
# Anydesk
######

wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
apt update -y
apt install -y anydesk
#'anydesk' in terminal

echo "neuro-IX|A-3434" | anydesk --set-password #Works even if option set-password still visible

######
# Anaconda
######
#Multi-user installation: https://askubuntu.com/questions/1457726/how-and-where-to-install-conda-to-be-accessible-to-all-users

#Dependencies
(sleep 10; echo y) | sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6

wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh -O /tmp/Anaconda3-2023.09-0-Linux-x86_64.sh 
bash /tmp/Anaconda3-2023.09-0-Linux-x86_64.sh -b -p /opt/anaconda #not on /usr/bin because of writing restrictions
rm /tmp/Anaconda3-2023.09-0-Linux-x86_64.sh 

groupadd anaconda
chgrp -R anaconda /opt/anaconda
chmod 770 -R /opt/anaconda

adduser bverreman anaconda
adduser sbouix anaconda
adduser at83760 anaconda
adduser at90180 anaconda
adduser at70870 anaconda
adduser at84490 anaconda

source ~/.bashrc
source /opt/anaconda/bin/activate
conda init
conda config --set auto_activate_base False # The base environment is not activated by default
#conda activate base
(sleep 10; echo y) | conda install anaconda-navigator
#'anaconda-navigator' in terminal

# Uninstallation
#conda activate
#conda init --reverse --all
#rm -rf /PATH/TO/ANACONDA
#source ~/.bashrc

######
# Git
######
(sleep 10; echo Y) | apt install git-all

######
# Datalad
######
(sleep 10; echo Y) | apt install datalad


############################
#EXTRA

######
# pip3
######
#(sleep 10; echo Y) | apt install python3-pip

######
# Zotero (No sudo)
######

#2023/12/20 18:03:54  info unpack layer: sha256:cbe3537751ce03ea42788c2fbe2d5
#wget -q "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=6.0.27" -O ~/Downloads/zotero_latest.tar.bz2
#tar -xjf ~/Downloads/zotero_latest.tar.bz2 -C $HOME
#mv Zotero_linux-x86_64 Zotero
#chmod +x $HOME/Zotero/set_launcher_icon
#$HOME/Zotero/set_launcher_icon
#ln -s $HOME/Zotero/zotero.desktop ~/.local/share/applications/zotero.desktop

######
# Miniconda3
######

#mkdir -p ~/miniconda3
#wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
#bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
#rm -rf ~/miniconda3/miniconda.sh

#~/miniconda3/bin/conda init bash

#source "$HOME/.profile"

#export PATH="$HOME/miniconda3/bin:$PATH"
#source "$HOME/miniconda3/bin/activate"

######
# Singularity
######

#conda install -c conda-forge singularity
#apt install python-is-python3 #Avoid /usr/bin/env: python: No such file or directory
#export SINGULARITY_CACHEDIR=/project/Neuro-IX/software/.singularity
#sudo -E singularity build fastsurfer-gpu.sif docker://deepmi/fastsurfer:latest

