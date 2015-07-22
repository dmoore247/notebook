#!/usr/bin/env bash

cd /jupyter/notebooks

source /jupyter/venv/bin/activate
jupyter notebook --ip=0.0.0.0 --no-browser
