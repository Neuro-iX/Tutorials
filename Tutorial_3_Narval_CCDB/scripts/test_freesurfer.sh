#!/bin/bash 

export SUBJECTS_DIR=/mnt/software/Freesurfer7.4.1_container

if [ -d "$SUBJECTS_DIR/bert" ] #bert folder does exist already
then
	  recon-all -autorecon1 -s bert
else
    recon-all -autorecon1 -s bert -i /usr/local/freesurfer/subjects/bert/mri/orig/001.mgz
fi

exit 0
