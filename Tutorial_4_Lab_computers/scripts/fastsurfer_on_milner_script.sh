#######
#Installation of FastSurfer
#######
#git clone --branch stable https://github.com/Deep-MI/FastSurfer.git
cd /project/Neuro-IX/software/FastSurfer
git fetch origin
git merge origin/main

conda remove -n fastsurfer_gpu --all
conda env create -f /project/Neuro-IX/software/FastSurfer/fastsurfer_env_gpu.yml

#sudo apt install tcsh
#conda install DONT WORK

#######
#Execution of FastSurfer
#######
conda activate fastsurfer_gpu

export FREESURFER_HOME=/project/Neuro-IX/software/freesurfer732
source $FREESURFER_HOME/SetUpFreeSurfer.sh

fastsurfer --fs_license /project/Neuro-IX/software/freesurfer732/license.txt --sid HCP_1200_100307_fs_test --sd ~/Documents/fastsurferTest --t1 /project/Neuro-IX/data/HCP_1200_structural_extended_preprocessed/100307/T1w/100307/mri/orig/001.mgz 
