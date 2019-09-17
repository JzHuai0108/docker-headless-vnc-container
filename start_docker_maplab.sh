#!/bin/bash
docker run -it --rm\
 -p 5901:5901 \
 -p 2222:22 \
 -v /docker_documents:/persist \
 --user 0 \
 --cpuset-cpus="0-3" \
 ros:maplab_vnc zsh
