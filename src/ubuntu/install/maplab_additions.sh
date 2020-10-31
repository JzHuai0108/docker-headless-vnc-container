#!/usr/bin/env bash
### every exit != 0 fails the script
set -e

echo "Install additional tools for development"
export ROS_DISTRO=kinetic
apt-get update
apt-get install -y \
    python3-yaml \
    python3-tk \
    python3-matplotlib \
    python3-pip \
    python-scipy \
    ros-${ROS_DISTRO}-cv-bridge \
    ros-${ROS_DISTRO}-image-transport \
    ros-${ROS_DISTRO}-message-filters \
    ros-${ROS_DISTRO}-tf \
    ros-${ROS_DISTRO}-tf-conversions \
    ros-${ROS_DISTRO}-node-manager-fkie \
    libeigen3-dev \
    libsuitesparse-dev \
    cmake

# to fix " *** No rule to make target '/opt/ros/kinetic/lib/liborocos-kdl.so.1.3.2', 
# needed by '/maplab_ws/devel/lib/libsimulation.so'.  Stop."
ln -s /opt/ros/kinetic/lib/liborocos-kdl.so.1.3 /opt/ros/kinetic/lib/liborocos-kdl.so.1.3.2

pip3 install --upgrade pip
pip2 install --upgrade pip
pip2 install PyPDF2
# pip3 install PyPDF2
# pip2 install -U pytest
# pip3 install -U pytest

apt-get clean -y
rm -rf /tmp/* /var/tmp/*
rm -rf /var/lib/apt/lists/*
