# Docker for Jupyter Notebook

The Jupyter HTML notebook is a web-based notebook environment for interactive computing packaged into a Docker image

Requirements:
* Win/Mac: boot2docker 1.7.1 or greater



Dev quickstart:

* run -d -i -p 8888:8888 -v ~/notebooks:/jupyter/notebooks dmoore247/jupyter:0.9.3


Launch with:
	export IP=`boot2docker ip`
	open http://$IP:8888/
