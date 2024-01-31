#!/bin/bash 

### SUBJECTS_DIR is the variable used by freesurfer to set the output directory path
export SUBJECTS_DIR=/mnt/software/Freesurfer7.4.1_container

if [ -d "$SUBJECTS_DIR/bert" ] ### Check if subject ("-s") 'bert' (=output folder) does exist already, and if not, give the raw_image path using "-i"
then
	  recon-all -autorecon1 -s bert ### Execute freesurfer pipeline step 1 (autorecon1 = skull-strip)
else
    recon-all -autorecon1 -s bert -i /usr/local/freesurfer/subjects/bert/mri/orig/001.mgz
fi

exit 0
