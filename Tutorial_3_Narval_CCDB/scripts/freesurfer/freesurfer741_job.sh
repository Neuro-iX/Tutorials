#!/bin/bash 
#SBATCH --account=def-sbouix
#SBATCH --time=0:01:00

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
	  echo "Add a script to execute in fs741.sif container. Example: sbatch ~/projects/def-sbouix/software/Freesurfer7.4.1_container/freesurfer741_job.sh ~/projects/def-sbouix/software/Freesurfer7.4.1_container/test_freesurfer.sh"
else
    echo "---Start container from fs741.sif"
    var=`echo $1 | awk -F 'def-sbouix/' '{print $2}'`
    srun apptainer exec --bind /lustre06/project/6074560:/mnt ~/projects/def-sbouix/software/Freesurfer7.4.1_container/fs741.sif bash /mnt/$var
    wait
    echo "---End container from fs741.sif"
fi

exit 0
