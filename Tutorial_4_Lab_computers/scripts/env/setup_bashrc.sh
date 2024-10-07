#!/bin/bash

builtin echo
"
setup_bashrc.sh is a script for adding setups to $HOME/.bashrc script, 
specific to computer labs from A-3413 (/project/Neuro-IX/software).
Use `cat $HOME/.bashrc` to check for any redundancies.
Author: Benoit Verreman
Last update: 09/11/2023
"

#########
## Reset $HOME/.bashrc by removing everything after "#########"
#########
sed -i '0,/#########/!d' $HOME/.bashrc


#########
## Function to both print on terminal and $HOME/.bashrc script
#########
Echo()
{
    builtin echo "$@" | tee -a $HOME/.bashrc
}

#########
## Add setups by sourcing a script in $HOME/.bashrc
#########
Echo "
#########
## Neuro-iX bashrc
#########
source /mnt/shared_data/softwares/env/Neuro_iX_bashrc.sh
"
#source /project/Neuro-IX... with previous server (Miller)
