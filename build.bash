#!/bin/bash
export PATH_SCRIPT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo $PATH_SCRIPT

docker build $PATH_SCRIPT -t my_ros_try --build-arg path=$PATH_SCRIPT 