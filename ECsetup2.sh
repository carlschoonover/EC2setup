conda create -n klusta python=2.7 --yes
conda install -n klusta scipy pandas=0.12 pytables=3.0 pyqt setuptools pip cython nose ipython-notebook matplotlib --yes
conda install -n klusta numpy=1.8 --yes
source activate klusta

echo >> ~/.bashrc
echo source activate klusta >> ~/.bashrc
pip install pyopengl
