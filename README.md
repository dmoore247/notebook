# Docker for Jupyter Notebook

The Jupyter HTML notebook is a web-based notebook environment for interactive computing packaged into a Docker image

Requirements:
* Mac: Docker Version 1.12.1+

Build Instructions
* ``docker build -t dmoore247/jupyter .``

Dev quickstart:
* ``mkdir ~/notebooks``
* ``docker run -d -p 8888:8888 -v ~/notebooks:/jupyter/notebooks dmoore247/jupyter:latest``

Launch with:
* ``open http://localhost:8888/``
