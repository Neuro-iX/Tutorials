#!/bin/bash

builtin echo
"
setup_bashrc.sh is a script for adding setups to $HOME/.bashrc script, 
specific to computer labs from A-3413 (/project/Neuro-IX/software).
Use `cat $HOME/.bashrc` to check for any redundancies.
Author: Benoit Verreman
Last update: 09/11/2023
"

#########
## Reset $HOME/.bashrc by removing everything after "#########"
#########
sed -i '0,/#########/!d' $HOME/.bashrc


#########
## Function to both print on terminal and $HOME/.bashrc script
#########
Echo()
{
    builtin echo "$@" | tee -a $HOME/.bashrc
}

#########
## Add setups in $HOME/.bashrc script
#########
Echo "
#########
## FSL Setup
#########
FSLDIR=/project/Neuro-IX/software/fsl6
. \$FSLDIR/etc/fslconf/fsl.sh
source /etc/environment #reset PATH
PATH=\$FSLDIR/share/fsl/bin:\$PATH
export FSLDIR PATH

#########
## Freesurfer Setup
#########
export FREESURFER_HOME=/project/Neuro-IX/software/freesurfer
source \$FREESURFER_HOME/SetUpFreeSurfer.sh

#########
## Slicer Setup
#########
export SITK_SHOW_COMMAND=/project/Neuro-IX/software/Slicer-5.6.0-linux-amd64
alias slicer='/project/Neuro-IX/software/Slicer-5.6.0-linux-amd64/Slicer'

#########
## Miniconda3 Setup
#########
export PATH="/project/Neuro-IX/software/miniconda3/bin:/home/user/miniconda3/condabin:\$PATH"
source "/project/Neuro-IX/software/miniconda3/bin/activate"
"

#########
## Source $HOME/.bashrc script
#########
source \$HOME/.bashrc
