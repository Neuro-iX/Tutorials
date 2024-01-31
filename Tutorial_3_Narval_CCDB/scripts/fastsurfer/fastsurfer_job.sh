#!/bin/bash 
#SBATCH --account=def-sbouix
#SBATCH --time=2:59:00
#SBATCH --job-name fastsurfer_job
#SBATCH --output=output_fastsurfer_%j.txt
#SBATCH --open-mode=append

### '#SBATCH ...' are directives (or options) in the job script (must precede all executable commands)
### Other examples:
# #SBATCH --nodes=1
# #SBATCH --ntasks-per-node=1
# #SBATCH --ntasks=1
# #SBATCH --mem-per-cpu=4000 
# #SBATCH --mail-user=...@...
# #SBATCH --mail-type=ALL

#################
## Help
#################
Help ()
{
echo "
AUTHOR: Benoît Verreman

LAST UPDATE: 2024-01-15

DESCRIPTION: 
On Narval computing server, use apptainer and the image fastsurfer-gpu.sif to create a container, and execute a second script inside.
You have to add the path to the second script to be executed inside the generated container.

EXAMPLE OF USAGE:
sbatch ~/projects/def-sbouix/software/fastsurfer/fastsurfer_job.sh ~/projects/def-sbouix/software/fastsurfer/test_fastsurfer.sh
"
}

#################
## Process
#################

### Load the software apptainer version 1.1.8 onto your Narval login node session
module load apptainer/1.1.8

if [[ -z "$1"  ||  "$1" == "-h" ||  "$1" == "--help"]] ### First variable is empty or need help
then
	Help ### Activate Help function
else ### You did add the second script to be executed inside the container
	echo "---Start container from fastsurfer_gpu.sif" 
	var=`echo $1 | awk -F 'def-sbouix/' '{print $2}'` ### Get the name of the second script to be executed inside the container
 
	### launch a job of creating a container using apptainer and the image file "fastsurfer-gpu.sif"
 	### --nv flag means enabling the use of the gpu
  	### --no-hone flag means not mounting the $HOME directory (add a pointer to $HOME inside the container)
   	### --bind flag means mounting a certain folder/file inside the container
    	### You need to mount freesurfer license.txt, the output directory, the path to your raw_data
     	### bash is used to launch the second script inside the container
 	srun apptainer exec --nv \
			--no-home \
			--bind /lustre06/project/6074560/data/AMPSCZ/rawdata/sub-BI02450/ses-202304111/anat/sub-BI02450_ses-202304111_rec-nonnorm_run-1_T1w_auxiliary.nii.gz:/data \
			--bind /scratch/bverre:/output \
			--bind /lustre06/project/6074560/software/fastsurfer/license.txt:/fs_license
			/project/def-sbouix/software/fastsurfer/fastsurfer-gpu.sif \
			bash /mnt/$var
	wait ### wait for the container to do its job before being killed
	echo "---End container from fastsurfer_gpu.sif"
fi

exit 0
