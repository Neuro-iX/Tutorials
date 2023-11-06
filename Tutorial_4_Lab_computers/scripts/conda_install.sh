
conda create -n monai
conda activate monai
conda install -y pytorch torchvision torchaudio pytorch-cuda=11.8 -c pytorch -c nvidia
conda install -y -c conda-forge git datalad jupyterlab monai tqdm numpy matplotlib pandas
conda install -y pandas seaborn
