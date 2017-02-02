FROM centos:latest

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

RUN /usr/bin/pip install pandas numpy pytz pyparsing datetime missingno

RUN pip install jupyter

RUN pip install statsmodels matplotlib pygal geoplotlib networkx bokeh ggplot

RUN pip install nltk
RUN pip install -U textblob

RUN yum -y install graphviz && pip install graphviz pydotplus

# RUN pip install pybrain
# RUN pip install --no-cache-dir scipy==0.15.1
# RUN pip install --no-cache-dir gensim==0.12.1
# RUN pip install -U scikit-learn
##RUN pip install git+https://github.com/jpmml/sklearn2pmml.git

ADD bootstrap.sh /opt/bootstrap.sh
RUN chmod +x /opt/bootstrap.sh
ADD jupyter_notebook_config.py /root/.jupyter/jupyter_notebook_config.py

RUN mkdir -p /jupyter/notebooks/notebook && mkdir -p /jupyter/notebooks/docs

WORKDIR /jupyter/notebooks
VOLUME ["/jupyter/notebooks"]

# Start it up
CMD ["/opt/bootstrap.sh", "-bash"]
# CMD ["bash"]

EXPOSE 8888
