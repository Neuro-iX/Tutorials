#!/bin/bash 
#SBATCH --account=def-sbouix
#SBATCH --time=0:01:00
#SBATCH --job-name freesurfer741_job
#SBATCH --output=output_freesurfer741_%j.txt
#SBATCH --open-mode=append

### '#SBATCH ...' are directives (or options) in the job script are prefixed with #SBATCH and must precede all executable commands
### Other examples:
##SBATCH --nodes=1
##SBATCH --ntasks-per-node=1
##SBATCH --ntasks=1
##SBATCH --mem-per-cpu=4000 
##SBATCH --mail-user=...@...
##SBATCH --mail-type=ALL

#################
## Help
#################
Help ()
{
echo "
AUTHOR: Benoît Verreman

LAST UPDATE: 2024-01-15

DESCRIPTION: 
On Narval computing server, use apptainer and the image fs741.sif to create a container, and execute a second script inside.
You have to add the path to the second script to be executed inside the generated container.

EXAMPLE OF USAGE:
sbatch ~/projects/def-sbouix/software/Freesurfer7.4.1_container/freesurfer741_job.sh ~/projects/def-sbouix/software/Freesurfer7.4.1_container/test_freesurfer.sh
"
}

#################
## Process
#################

### Load the software apptainer version 1.1.8 onto your Narval login node session
module load apptainer/1.1.8

if [[ -z "$1"  ||  "$1" == "-h" ||  "$1" == "--help"]]; then ### First variable is empty or need help
	Help ### Activate Help function
 else ### You did add the second script to be executed inside the container
    echo "---Start container from fs741.sif"
    var=`echo $1 | awk -F 'def-sbouix/' '{print $2}'` ### Get the name of the second script to be executed inside the container
    
    ### launch a job of creating a container using apptainer and the image file "fs741.sif"
    ### --bind flag means mounting a certain folder/file inside the container
    ### You need to mount a path to get access to freesurfer license.txt, the output directory, the path to your raw_data
    ### bash is used to launch the second script inside the container
    srun apptainer exec --bind /lustre06/project/6074560:/mnt ~/projects/def-sbouix/software/Freesurfer7.4.1_container/fs741.sif bash /mnt/$var
    wait ### wait for the container to do its job before being killed
    echo "---End container from fs741.sif"
fi

exit 0
