######
# Installing last vs code 
######

wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O /tmp/code_latest_amd64.deb
dpkg -i /tmp/code_latest_amd64.deb

######
# Installing for Globus : https://docs.globus.org/globus-connect-personal/install/linux/
######

#apt-get install tk tcllib #Prerequisite
#wget https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz
#tar xzf globusconnectpersonal-latest.tgz

# cd globusconnectpersonal*
# ./globusconnectpersonal

######
# Installing discord
######

wget "https://discord.com/api/download?platform=linux&format=deb" -O /tmp/latest-discord.deb
sudo dpkg -i /tmp/latest-discord.deb

######
# Installing Anydesk
######

wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
apt update -y
apt install -y anydesk

######
# Installing Zotero (No sudo)
######
2023/12/20 18:03:54  info unpack layer: sha256:cbe3537751ce03ea42788c2fbe2d5
wget -q "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=6.0.27" -O ~/Downloads/zotero_latest.tar.bz2
tar -xjf ~/Downloads/zotero_latest.tar.bz2 -C $HOME
mv Zotero_linux-x86_64 Zotero
chmod +x $HOME/Zotero/set_launcher_icon
$HOME/Zotero/set_launcher_icon
ln -s $HOME/Zotero/zotero.desktop ~/.local/share/applications/zotero.desktop

######
# Miniconda3
######

mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

~/miniconda3/bin/conda init bash

source "$HOME/.profile"

export PATH="$HOME/miniconda3/bin:$PATH"
source "$HOME/miniconda3/bin/activate"

######
# Singularity
######

#conda install -c conda-forge singularity
#apt install python-is-python3 #Avoid /usr/bin/env: python: No such file or directory
#export SINGULARITY_CACHEDIR=/project/Neuro-IX/software/.singularity
#sudo -E singularity build fastsurfer-gpu.sif docker://deepmi/fastsurfer:latest

