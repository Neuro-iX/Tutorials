#!/bin/bash

builtin echo
"
Neuro_iX_bashrc.sh is a script for completing setups to $HOME/.bashrc, 
specific to lab computers from A-3434 (/project/hippocmapus/common/softwares/env).
Use `cat $HOME/.bashrc` to check for any redundancies.
Author: Benoit Verreman
Last update: 19/02/2025
"

#########
## FSL Setup
#########
FSLDIR=/project/hippocampus/softwares/fsl
. $FSLDIR/etc/fslconf/fsl.sh
source /etc/environment #reset PATH
PATH=$FSLDIR/share/fsl/bin:/usr/share:$PATH
export FSLDIR PATH

#########
## Freesurfer Setup
#########
export FREESURFER_HOME=/mnt/shared_data/softwares/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

#########
## Slicer Setup
#########
export SITK_SHOW_COMMAND=/mnt/shared_data/softwares/slicer
alias slicer='$SITK_SHOW_COMMAND/Slicer'
