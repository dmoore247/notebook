# Docker for Jupyter Notebook

The Jupyter HTML notebook is a web-based notebook environment for interactive computing packaged into a Docker image

Requirements:
* Win/Mac: boot2docker 1.7.1 or greater [https://github.com/boot2docker/boot2docker/releases/tag/v1.7.1]

Dev quickstart:
* ``mkdir ~/notebooks``
* ``docker run -d -p 8888:8888 -v ~/notebooks:/jupyter/notebooks -t -i dmoore247/jupyter:0.9.4``

Launch with:
* ``export IP=`boot2docker ip` ``
* ``open http://$IP:8888/``


## Build Instructions
* ``docker build -t `cat version` .``
