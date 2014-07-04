wget http://repo.continuum.io/miniconda/Miniconda-3.4.2-Linux-x86_64.sh -O miniconda.sh;

bash miniconda.sh -b -p $HOME/miniconda
export PATH="$HOME/miniconda/bin:$PATH"

conda install conda-build binstar --yes

# Crazily, conda needs jinja2...
conda install jinja2 setuptools --yes
