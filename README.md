# Docker for Jupyter Notebook

The Jupyter HTML notebook is a web-based notebook environment for interactive computing packaged into a Docker image

Requirements:
* Win/Mac: Docker Version 1.12.1

Dev quickstart:
* ``mkdir ~/notebooks``
* ``docker run -d -p 8888:8888 -v ~/notebooks:/jupyter/notebooks jupyter:latest jupyter notebook --no-browser --ip=0.0.0.0``

Launch with:
* ``open http://localhost:8888/``

## Build Instructions
* ``docker build -t jupyter - < Dockerfile``
