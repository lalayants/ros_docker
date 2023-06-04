ROOT_DIR="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
EXEC_PATH=$PWD
BASE_DIST="ubuntu:20.04"
ROS1_DISTRO="noetic"

docker build $ROOT_DIR \
    --build-arg BASE_IMG=$BASE_DIST \
    --build-arg ROS1_DISTRO=$ROS1_DISTRO \
    -t lalayants/ros:$ROS1_DISTRO