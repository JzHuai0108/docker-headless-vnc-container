#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install tools for maplab installation"

apt-get install -y \
    autotools-dev \
    ccache \
    doxygen \
    dh-autoreconf \
    git \
    liblapack-dev \
    libblas-dev \
    libgtest-dev \
    libgoogle-glog-dev \
    libreadline-dev \
    libssh2-1-dev \
    pylint \
    clang-format-3.8 \
    python-autopep8 \
    python-catkin-tools \
    python-pip \
    python-git \
    python-setuptools \
    python-termcolor \
    python-wstool

pip2 install --upgrade pip
pip2 install requests
