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
# Installing Singularity: See https://docs.sylabs.io/guides/3.0/user-guide/installation.html#install-dependencies
######
#TO TEST

wget https://github.com/sylabs/singularity/releases/download/v4.0.2/singularity-ce-4.0.2.tar.gz ~/Downloads/singularity-ce-4.0.2.tar.gz #Use latest link?
tar -C ~/Documents -xzf ~/Downloads/singularity-ce-4.0.2.tar.gz
rm ~/Downloads/singularity-ce-4.0.2.tar.gz

#Dependencies
apt-get update && sudo apt-get install -y \
    build-essential \
    libssl-dev \
    uuid-dev \
    libgpgme11-dev \
    squashfs-tools \
    libseccomp-dev \
    pkg-config
    
#Go dependency
export VERSION=1.21.5 OS=linux ARCH=amd64 && \
  wget https://dl.google.com/go/go$VERSION.$OS-$ARCH.tar.gz ~/Downloads/go$VERSION.$OS-$ARCH.tar.gz && \
  tar -C . -xzvf go$VERSION.$OS-$ARCH.tar.gz && \
  rm go$VERSION.$OS-$ARCH.tar.gz

#Singularity RPM
export VERSION=4.0.2 && # adjust this as necessary \
    wget https://github.com/sylabs/singularity/releases/download/v${VERSION}/singularity-ce-${VERSION}.tar.gz  ~/Downloads/singularity-ce-${VERSION}.tar.gz && \
    rpmbuild -tb --define='_localstatedir /project/Neuro-IX/software' singularity-ce-${VERSION}.tar.gz && \ 
    rpm -ivh ~/rpmbuild/RPMS/x86_64/singularity-$VERSION-1.el7.x86_64.rpm && \
    rm -rf ~/rpmbuild singularity-$VERSION*.tar.gz
    
