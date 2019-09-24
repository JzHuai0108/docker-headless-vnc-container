#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

mkdir /tmp/pangolin
cd /tmp/pangolin

apt-get update
apt install -y libglew-dev

git clone https://github.com/stevenlovegrove/Pangolin.git
cd Pangolin
mkdir build
cd build
cmake ..
cmake --build .
make install

rm -rf /tmp/pangolin/*
