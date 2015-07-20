# necessary for Centos 6
cd /jupyter
pip install virtualenv
pip install virtualenvwrapper
virtualenv venv
virtualenv -p /usr/local/bin/python2.7 venv
source venv/bin/activate
cd /jupyter/notebook
pip --version
pip list
pip install --upgrade setuptools
pip install -r requirements.txt -e .
pip install terminado functools32
