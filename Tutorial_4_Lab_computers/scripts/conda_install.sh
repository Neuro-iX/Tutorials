

mkdir -p ~/miniconda3
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3
rm -rf ~/miniconda3/miniconda.sh

~/miniconda3/bin/conda init bash

source "$HOME/.profile"

export PATH="$HOME/miniconda3/bin:$PATH"
source "$HOME/miniconda3/bin/activate"
conda create -n monai
conda activate monai
conda install -y pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
conda install -y -c conda-forge git datalad jupyterlab monai tqdm numpy matplotlib pandas
conda install -y pandas seaborn