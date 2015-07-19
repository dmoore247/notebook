# bootstrap.sh
cd /jupyter
virtualenv venv
virtualenv -p /usr/local/bin/python2.7 venv
source venv/bin/activate
cd notebook
jupyter notebook
