#!/bin/bash

builtin echo
"
setup_bashrc.sh is a script for adding setups to $HOME/.bashrc script, 
specific to computer labs from A-3434 (/project/hippocmapus/common/softwares).
Use `cat $HOME/.bashrc` to check for any redundancies.
Author: Benoit Verreman
Last update: 19/02/2025
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
source /project/hippocmapus/common/softwares/env/Neuro_iX_bashrc.sh
"
