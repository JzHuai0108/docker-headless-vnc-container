#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install tools for maplab installation"

if [ "x$(nproc)" = "x1" ] ;
then export USE_PROC=1 ;
else export USE_PROC=$(($(nproc)/2)) ; 
fi
export UBUNTU_VERSION=xenial
export ROS_DISTRO=kinetic
# NOTE: Follow the official ROS installation instructions for melodic.
apt update
apt install software-properties-common
add-apt-repository "deb http://packages.ros.org/ros/ubuntu $UBUNTU_VERSION main"
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | sudo apt-key add -
apt update
apt install ros-$ROS_VERSION-desktop-full "ros-$ROS_VERSION-tf2-*" "ros-$ROS_VERSION-camera-info-manager*" --yes

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
    python-wstool \
    libatlas3-base

pip2 install requests

apt-get clean -y
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*
