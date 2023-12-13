conda activate fastsurfer_gpu

export FREESURFER_HOME=/project/Neuro-IX/software/freesurfer732
source $FREESURFER_HOME/SetUpFreeSurfer.sh

#sudo apt install tcsh
#conda install DONT WORK

fastsurfer --fs_license /project/Neuro-IX/software/freesurfer732/license.txt --sid HCP_1200_100307_v5 --sd ~/Documents/fastsurferTest --t1 /project/Neuro-IX/data/HCP_1200_structural_extended_preprocessed/100307/T1w/100307/mri/orig/001.mgz 
