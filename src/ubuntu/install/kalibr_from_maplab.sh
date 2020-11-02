#!/usr/bin/env bash
# Install extra packages required by kalibr after 
# the dependencies of maplab have been installed.
### every exit != 0 fails the script
set -e
apt-get update
apt-get install -y \
    libv4l-dev

# pip2 install python-igraph --upgrade # maybe slow in China, use the below approach.
pip2 install -i http://mirrors.aliyun.com/pypi/simple/ --trusted-host mirrors.aliyun.com python-igraph --upgrade

apt-get clean -y
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*