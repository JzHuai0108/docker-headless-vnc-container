#!/bin/bash

# asssume the working dir is the docker-headless-vnc-container repo
rm -f Dockerfile
cp Dockerfile.ros.kinetic Dockerfile
CMD="docker build -t ros:kinetic ."
source retry.sh

rm -f Dockerfile
cp Dockerfile.maplab.vnc Dockerfile
CMD="docker build -t ros:maplab_vnc ."
source retry.sh

rm -f Dockerfile
