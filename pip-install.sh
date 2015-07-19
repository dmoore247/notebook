# necessary for Centos 6
cd /jupyter
pip install virtualenv
pip install virtualenvwrapper
virtualenv venv
virtualenv -p /usr/local/bin/python2.7 venv
source venv/bin/activate
cd notebook
pip --version
pip install --upgrade setuptools
pip install functools32
pip install terminado
pip install -r requirements.txt -e .
