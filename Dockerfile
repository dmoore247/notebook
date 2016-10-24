FROM centos

# update
RUN yum -y update
RUN yum -y install wget

# install pip
RUN curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py" && python ./get-pip.py


RUN yum -y install \
    build-essential \
    make \
    gcc \
    zlib1g-dev \
    git \
    python \
    python-dev \
    python-virtualenv \
    python-pip \
    python3-dev \
    python3-pip \
    python-sphinx \
    python3-sphinx \
    libzmq3-dev \
    sqlite3 \
    libsqlite3-dev \
    pandoc \
    libcurl4-openssl-dev \
    nodejs \
    nodejs-legacy \
    npm

RUN yum -y groupinstall "Development tools"

RUN yum -y install \
        zlib-devel \
        bzip2-devel \
        openssl-devel \
        ncurses-devel \
        sqlite-devel \
        wget \
        tar \
        sudo \
        which

RUN yum -y install java

RUN pip install pandas
RUN pip install numpy
RUN pip install --no-cache-dir scipy==0.15.1
RUN pip install --no-cache-dir gensim==0.12.1
RUN pip install -U scikit-learn
RUN pip install git+https://github.com/jpmml/sklearn2pmml.git
RUN pip install jupyter
RUN pip install matplotlib
RUN pip install pygal
RUN pip install geoplotlib
RUN pip install missingno
RUN pip install networkx
RUN pip install pybrain
RUN pip install nltk
RUN pip install datetime
RUN pip install -U textblob

RUN pip install statsmodels
RUN pip install bokeh
RUN pip install ggplot
RUN pip install struct
RUN pip install os

RUN yum -y install graphviz
RUN pip install graphviz
RUN pip install pydotplus

RUN mkdir -p /opt
RUN wget https://raw.githubusercontent.com/dmoore247/notebook/master/bootstrap.sh -O /opt/bootstrap.sh && chmod +x /opt/bootstrap.sh

RUN mkdir -p /jupyter/notebooks/notebook

WORKDIR /jupyter/notebooks
VOLUME ["/jupyter/notebooks"]

# Start it up
CMD ["/opt/bootstrap.sh", "-bash"]

# CMD ["/usr/bin/jupyter","--ip=0.0.0.0","notebook" "--no-browswer"]

EXPOSE 8888
