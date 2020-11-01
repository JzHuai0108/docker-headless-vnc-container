#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install tools for maplab installation"

apt-get update
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

# https://stackoverflow.com/questions/37495375/python-pip-install-throws-typeerror-unsupported-operand-types-for-retry
apt-get remove -y python-pip python3-pip
mkdir -p /tmp/get-pip
cd /tmp/get-pip
wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
python3 get-pip.py

pip3 install --upgrade pip

pip2 install --upgrade pip
pip2 install requests

