#!/bin/bash

#/project/Neuro-IX/software... with previous server (Miller)
# /mnt/shared_data/softwares for hippocampus

#########
## FSL Setup
#########
FSLDIR=/mnt/shared_data/softwares/fsl
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
