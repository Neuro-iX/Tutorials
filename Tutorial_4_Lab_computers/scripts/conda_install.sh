
conda create -n monai
conda activate monai
conda install -y pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
conda install -y -c conda-forge git datalad jupyterlab monai tqdm numpy matplotlib pandas
conda install -y pandas seaborn

conda install -c conda-forge cxx-compiler
conda install -c conda-forge ninja
conda install -c anaconda python=3.8

rm -rf /home/at83760/.cache/torch_extensions
apt-get update
apt-get upgrade
