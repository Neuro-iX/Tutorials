#!/bin/bash

#########
## FSL Setup
#########
FSLDIR=/project/Neuro-IX/software/fsl6
. $FSLDIR/etc/fslconf/fsl.sh
source /etc/environment #reset PATH
PATH=$FSLDIR/share/fsl/bin:/usr/share:$PATH
export FSLDIR PATH

#########
## Freesurfer Setup
#########
export FREESURFER_HOME=/project/Neuro-IX/software/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh

#########
## Slicer Setup
#########
export SITK_SHOW_COMMAND=/project/Neuro-IX/software/Slicer-5.6.1-linux-amd64
alias slicer='$SITK_SHOW_COMMAND/Slicer'

#########
## Miniconda3 Setup
#########
export PATH="/project/Neuro-IX/software/miniconda3/bin:/home/user/miniconda3/condabin:$PATH"
source "/project/Neuro-IX/software/miniconda3/bin/activate"

#########
## FastSurfer
#########
export FASTSURFER_HOME=/project/Neuro-IX/software/FastSurfer
alias fastsurfer='$FASTSURFER_HOME/run_fastsurfer.sh'
export PATH="/project/Neuro-IX/software/miniconda3/bin/python:/project/Neuro-IX/software/FastSurfer:$PATH"

#########
## Anydesk
#########
alias anydesk='/project/Neuro-IX/software/anydesk-6.3.0/anydesk'

#########
## Globus
#########
alias globus='bash /project/Neuro-IX/software/globusconnectpersonal-3.2.3/globusconnectpersonal'

