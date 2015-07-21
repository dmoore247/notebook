# Installs Jupyter Notebook and IPython kernel from the current branch
# Another Docker container should inherit with `FROM jupyter/notebook`
# to run actual services.

FROM centos:centos6

MAINTAINER Project Jupyter <jupyter@googlegroups.com>


# Not essential, but wise to set the lang
# Note: Users with other languages should set this in their derivative image
RUN yum -y update

RUN yum -y install epel-release

# Python binary dependencies, developer tools
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

# install python 2.7
WORKDIR /opt
RUN wget --no-check-certificate https://www.python.org/ftp/python/2.7.9/Python-2.7.9.tar.xz
RUN tar xf Python-2.7.9.tar.xz
WORKDIR Python-2.7.9
RUN ./configure --prefix=/usr/local
RUN make && make altinstall


# install pip
WORKDIR /jupyter/
RUN git clone https://github.com/dmoore247/notebook.git

WORKDIR notebook
RUN bash /jupyter/notebook/pip-install.sh

# npm install
RUN npm config set prefix /usr/local &&  npm install -g bower &&  npm install -g gulp

# install bower and node and web stuff
RUN source /jupyter/venv/bin/activate && python setup.py install

# fixup bootstrap.sh
RUN chmod +x /jupyter/notebook/bootstrap.sh

# Start it up
CMD ["/jupyter/notebook/bootstrap.sh", "-bash"]

# Permit the world in
EXPOSE 8888
