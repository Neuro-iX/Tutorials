# Tutorials

All the tutorials are in jupyter notebook format.
You are welcome to update/improve previous tutorials or add your own (Cf. Tutorial on how to use github, git and datalad).

## New member

You can add your professionnal information for the website Neuro-iX.github.io using this Google Form:
https://forms.gle/ED53rp24KYCZtMYu7

## Install Miniconda for Linux
https://docs.conda.io/en/latest/miniconda.html#linux-installers

mkdir -p ~/miniconda3

wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh

bash ~/Downloads/Miniconda3-latest-Linux-x86_64.sh -b -u -p ~/miniconda3

rm -rf ~/Downloads/Miniconda3-latest-Linux-x86_64.sh

~/miniconda3/bin/conda init bash

source ./bashrc

## Install Jupyterlab for Linux

conda install -c conda-forge jupyterlab

jupyter lab

## Binder links

