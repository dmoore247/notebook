#!/usr/bin/env bash
# 
# Finish setup, by running python setup.py
#
cd /jupyter
virtualenv venv
virtualenv -p /usr/local/bin/python2.7 venv
source venv/bin/activate
cd notebook
python setup.py install
