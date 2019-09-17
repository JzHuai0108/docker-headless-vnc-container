#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install tools for maplab installation"

if [ "x$(nproc)" = "x1" ] ;
then export USE_PROC=1 ;
else export USE_PROC=$(($(nproc)/2)) ; 
fi
export UBUNTU_VERSION=xenial
export ROS_VERSION=kinetic
# NOTE: Follow the official ROS installation instructions for melodic.
apt-get update -y
DEBIAN_FRONTEND=noninteractive apt-get install -y software-properties-common wget
add-apt-repository "deb http://packages.ros.org/ros/ubuntu $UBUNTU_VERSION main"
wget https://raw.githubusercontent.com/ros/rosdistro/master/ros.key -O - | apt-key add -
apt-get update
apt-get install ros-$ROS_VERSION-desktop-full "ros-$ROS_VERSION-tf2-*" "ros-$ROS_VERSION-camera-info-manager*" --yes

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

# Update ROS environment
rosdep init
rosdep update
echo ". /opt/ros/$ROS_VERSION/setup.bash" >> ~/.bashrc