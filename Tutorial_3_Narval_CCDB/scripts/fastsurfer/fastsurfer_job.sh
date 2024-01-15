#!/bin/bash 
#SBATCH --account=def-sbouix
#SBATCH --time=2:59:00

##SBATCH --nodes=1
##SBATCH --ntasks-per-node=1
##SBATCH --ntasks=1
##SBATCH --mem-per-cpu=4000 

#SBATCH --job-name freesurfer741_job
#SBATCH --output=output_freesurfer741_%j.txt
#SBATCH --open-mode=append

##SBATCH --mail-user=...@...
##SBATCH --mail-type=ALL

module load apptainer/1.1.8

if [ -z "$1" ] #First variable is empty
then
	echo "Add a script to execute in fastsurfer_gpu.sif generated container.
Example: sbatch ~/projects/def-sbouix/software/fastsurfer/fastsurfer_job.sh ~/projects/def-sbouix/software/fastsurfer/test_fastsurfer.sh"
else
	echo "---Start container from fastsurfer_gpu.sif"
	var=`echo $1 | awk -F 'def-sbouix/' '{print $2}'`
	srun apptainer exec --nv \
			--no-home \
			--bind /lustre06/project/6074560/data/AMPSCZ/rawdata/sub-BI02450/ses-202304111/anat/sub-BI02450_ses-202304111_rec-nonnorm_run-1_T1w_auxiliary.nii.gz:/data \
			--bind /scratch/bverre:/output \
			--bind /lustre06/project/6074560/software/fastsurfer/license.txt:/fs_license
			/project/def-sbouix/software/fastsurfer/fastsurfer-gpu.sif \
			bash /mnt/$var
	wait
	echo "---End container from fastsurfer_gpu.sif"
fi

exit 0
