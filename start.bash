# CWD=$(pwd)/ros_ws
export PATH_SCRIPT="$( cd -- "$(dirname "$0")" >/dev/null 2>&1 ; pwd -P )"
echo $PATH_SCRIPT
# echo $CWD

# IP=$(ifconfig en0 | grep inet | awk '$1=="inet" {print $2}')
# # echo $IP

xhost +local:docker

docker run -it \
-v $PATH_SCRIPT/../ros_ws:/ros_ws \
-e DISPLAY=$DISPLAY \
-e "QT_X11_NO_MITSHM=1" \
-e XAUTHORITY \
-v /tmp/.X11-unix:/tmp/.X11-unix:rw \
-v /etc/localtime:/etc/localtime:ro \
--privileged \
--net=host \
--name ROS \
--rm my_ros_try
