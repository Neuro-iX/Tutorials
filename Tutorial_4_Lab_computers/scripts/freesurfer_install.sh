wget https://surfer.nmr.mgh.harvard.edu/pub/dist/freesurfer/7.4.1/freesurfer_ubuntu22-7.4.1_amd64.deb -O /tmp/freesurfer.deb

sudo dpkg -i /tmp/freesurfer.deb

rm /tmp/freesurfer.deb

Echo()
{
    builtin echo "$@" | tee -a $HOME/.bashrc
}

#########
## Add setups by sourcing a script in $HOME/.bashrc
#########
Echo "

#########
## Freesurfer Setup
#########
export FREESURFER_HOME=/usr/local/freesurfer/7.4.1/
source $FREESURFER_HOME/SetUpFreeSurfer.sh
export FS_LICENSE=$HOME/license.txt
"

