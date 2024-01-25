#!/bin/bash

#################
## Help
#################
Help ()
{
builtin echo "
AUTHOR: Benoît Verreman

LAST UPDATE: 2024-01-17

DESCRIPTION: 
Common softwares installation script for new computers.
Don't reinstall any existing software.
To be launched as SUDO.
For Globus and Zotero, you HAVE TO give a HOME path directory using -p.

EXAMPLE OF USAGE:
sudo su
bash test.sh -h
bash test.sh -p /home/at83760

LIST OF SOFTWARES:
- SSHFS
- CUDA with update-alternatives
- VScode
- Globus
- Discord Desktop
- Anydesk
- Anaconda (with anaconda-navigator in base environement)
- Git
- Datalad
- Zotero
- Docker
- Apptainer
- Slicer
"
}

unset -v HOME_PATH

VALID_ARGS=$(getopt -o p:h --long path:,help -- "$@")

eval set -- "$VALID_ARGS"
while [ : ]; do
  case "$1" in
    -p | --path)
      HOME_PATH=$2
      shift 2
      ;;
    -h | --help)
    	Help
    	exit 1
    	;;
    --) shift; 
      break 
      ;;
  esac
done

# Test if user provided HOME_PATH
: ${HOME_PATH:?Missing argument --path or -p}

###############################
######
# SSHFS
######
which sshfs >/dev/null 2>&1
if [ $? -eq 1 ]; then
    apt install sshfs
fi

######
# CUDA
######
which cuda >/dev/null 2>&1
if [ $? -eq 1 ]; then
  export var = "12.2.0"
  export var2 = "cuda_12.2.0_535.54.03_linux.run"
  export var3 = "12.2"
  wget "https://developer.download.nvidia.com/compute/cuda/$var/local_installers/$var2" -O /tmp/$var2;
  chmod +x /tmp/$var2;
  sudo ./tmp/$var2 --silent --toolkit;
  
  update-alternatives --install /usr/bin/cuda cuda /usr/local/cuda-$var3/bin 100
  echo '' >> $HOME_PATH/.bashrc
  echo '### CUDA' >> $HOME_PATH/.bashrc
  echo 'export PATH=/usr/local/cuda/bin:$PATH' >> $HOME_PATH/.bashrc
  echo 'LD_LIBRARY_PATH=/usr/local/cuda/lib64:$LD_LIBRARY_PATH' >> $HOME_PATH/.bashrc
  
  #update-alternatives --list cuda
  #nvcc --version

  #sudo update-alternatives --set cuda /usr/local/cuda-11.8/bin #change the cuda version
  #update-alternatives --get-selections #list all categrories
fi

######
# VScode 
######
which code >/dev/null 2>&1
if [ $? -eq 1 ]; then
    wget 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64' -O /tmp/code_latest_amd64.deb
    dpkg -i /tmp/code_latest_amd64.deb
    rm /tmp/code_latest_amd64.deb
    #'code' in terminal
fi


######
# Globus : https://docs.globus.org/globus-connect-personal/install/linux/
######
if ! [ -d $HOME_PATH/globus* ]; then 
    (sleep 10; echo Y) | apt-get install tk tcllib;
    wget 'https://downloads.globus.org/globus-connect-personal/linux/stable/globusconnectpersonal-latest.tgz' -O /tmp/globusconnectpersonal-latest.tgz;
    tar xzf /tmp/globusconnectpersonal-latest.tgz -C $HOME_PATH;
    rm /tmp/globusconnectpersonal-latest.tgz;
fi

# bash $HOME/globusconnectpersonal*/globusconnectpersonal
#Existing organizational login: Compute Canada
#Use CCDB login info
#Create new collection (corresponding to you desktop)

######
# Discord Dekstop
######
which discord >/dev/null 2>&1
if [ $? -eq 1 ]; then
    wget "https://discord.com/api/download?platform=linux&format=deb" -O /tmp/latest-discord.deb
    dpkg -i /tmp/latest-discord.deb
    rm /tmp/latest-discord.deb
    #'discord' in terminal
fi

######
# Anydesk
######
which anydesk >/dev/null 2>&1
if [ $? -eq 1 ]; then
    wget -qO - https://keys.anydesk.com/repos/DEB-GPG-KEY | apt-key add -
    echo "deb http://deb.anydesk.com/ all main" > /etc/apt/sources.list.d/anydesk-stable.list
    apt update -y
    apt install -y anydesk
    #'anydesk' in terminal
    
    echo "neuro-IX|A-3434" | anydesk --set-password #Works even if option set-password still visible
fi

######
# Anaconda
######
which conda >/dev/null 2>&1
if [ $? -eq 1 ]; then
    #Multi-user installation: https://askubuntu.com/questions/1457726/how-and-where-to-install-conda-to-be-accessible-to-all-users
    
    #Dependencies
    (sleep 10; echo y) | sudo apt-get install libgl1-mesa-glx libegl1-mesa libxrandr2 libxrandr2 libxss1 libxcursor1 libxcomposite1 libasound2 libxi6 libxtst6
    
    wget https://repo.anaconda.com/archive/Anaconda3-2023.09-0-Linux-x86_64.sh -O /tmp/Anaconda3-2023.09-0-Linux-x86_64.sh 
    bash /tmp/Anaconda3-2023.09-0-Linux-x86_64.sh -b -p /opt/anaconda #not on /usr/bin because of writing restrictions
    rm /tmp/Anaconda3-2023.09-0-Linux-x86_64.sh 
    
    groupadd anaconda
    chgrp -R anaconda /opt/anaconda
    chmod 770 -R /opt/anacond
    #ls -la /opt/anaconda
    
    adduser bverreman anaconda
    adduser sbouix anaconda
    adduser at83760 anaconda
    adduser at90180 anaconda
    adduser at70870 anaconda
    adduser at84490 anaconda
    #cat /etc/group
    
    #cat > /tmp/fresh_install_subscript.sh <<EOF
    #source ~/.bashrc
    #source /opt/anaconda/bin/activate #Has to be executed as not-root
    #conda init
    #conda config --set auto_activate_base False
    #conda deactivate
    #EOF
    #chmod 777 /tmp/fresh_install_subscript.sh #give rights
    #su -c '/tmp/fresh_install_subscript.sh' bverreman #executed as not-root (bverreman)
    #rm /tmp/fresh_install_subscript.sh 
    
    source /opt/anaconda/bin/activate 
    conda init
    conda config --set auto_activate_base False # The base environment is not activated by default
    #conda activate base
    (sleep 10; echo y) | conda install anaconda-navigator
    #'anaconda-navigator' in terminal
    conda deactivate
    
    # Uninstallation
    #conda activate
    #conda init --reverse --all
    #rm -rf /PATH/TO/ANACONDA
    #source ~/.bashrc
fi

######
# Git
######
which git >/dev/null 2>&1
if [ $? -eq 1 ]; then
  (sleep 10; echo Y) | apt install git-all
fi

######
# Datalad
######
which datalad >/dev/null 2>&1
if [ $? -eq 1 ]; then
  (sleep 10; echo Y) | apt install datalad
fi

######
# Zotero (No sudo)
######
if ! [ -d $HOME_PATH/Zotero* ]; then 
  wget -q "https://www.zotero.org/download/client/dl?channel=release&platform=linux-x86_64&version=6.0.27" -O /tmp/zotero_latest.tar.bz2
  tar -xjf /tmp/zotero_latest.tar.bz2 -C $HOME_PATH
  mv $HOME_PATH/Zotero_linux-x86_64 $HOME_PATH/Zotero
  #chmod +x $HOME_PATH/Zotero/set_launcher_icon
  #$HOME_PATH/Zotero/set_launcher_icon
  #ln -s $HOME_PATH/Zotero/zotero.desktop ~/.local/share/applications/zotero.desktop
  
  #bash $HOME/Zotero/zotero
fi

######
# Docker Dekstop
######
which docker >/dev/null 2>&1
if [ $? -eq 1 ]; then
  # Add Docker's official GPG key:
  apt-get update
  apt-get install ca-certificates curl gnupg
  sudo install -m 0755 -d /etc/apt/keyrings
  curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
  chmod a+r /etc/apt/keyrings/docker.gpg
  
  # Add the repository to Apt sources:
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
  apt-get update
  
  (sleep 10; echo Y) | apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin #dependencies
  docker run hello-world #testing installation
  #'docker' in terminal
fi

######
# Apptainer
######
which apptainer >/dev/null 2>&1
if [ $? -eq 1 ]; then
  apt update
  apt install -y software-properties-common
  
  add-apt-repository -y ppa:apptainer/ppa
  apt update
  apt install -y apptainer
fi


######
# Slicer 
######
if ! [ -d $HOME_PATH/Slicer* ]; then 
  wget https://download.slicer.org/bitstream/657813b183a3201b44d4e6f7 -O /tmp/slicer.tar.gz
  tar xzf /tmp/slicer.tar.gz -C $HOME_PATH
  rm /tmp/slicer.tar.gz
  
  echo '' >> $HOME_PATH/.bashrc
  echo '### Slicer' >> $HOME_PATH/.bashrc
  echo "export SITK_SHOW_COMMAND=$HOME_PATH/Slicer*" >> $HOME_PATH/.bashrc
  echo 'alias slicer=$SITK_SHOW_COMMAND/Slicer' >> $HOME_PATH/.bashrc
fi

############################
#EXTRA

######
# pip3 
######
#(sleep 10; echo Y) | apt install python3-pip

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

