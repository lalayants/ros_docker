FROM ros:noetic

RUN apt-get update && apt-get upgrade -y
# RUN apt-get -y install python3 python3-pip

# Timezone Configuration
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get install vim wget build-essential cmake g++ libopencv-dev software-properties-common \
    mesa-utils libcanberra-gtk-module libcanberra-gtk3-module -y

RUN apt-get -y install rviz

RUN apt install net-tools vim -y


# RUN chmod 777 /opt/ros/noetic/setup.bash
# RUN ./opt/ros/noetic/setup.bash

RUN apt install tmux -y

RUN apt install firefox -y
RUN apt-get update

RUN apt install python3-rosdep python3-rosinstall python3-rosinstall-generator python3-wstool build-essential -y
RUN apt-get install python3-rospy -y
RUN apt-get install ros-noetic-teleop-twist-keyboard -y
RUN rm /etc/ros/rosdep/sources.list.d/20-default.list
RUN rosdep init 
RUN rosdep update

ENV DEBIAN_FRONTEND=noninteractive
RUN apt install xorg openbox xauth -y

RUN apt install python3-pip -y

RUN pip3 install scipy

RUN apt-get install ros-noetic-tf -y

RUN apt install zsh -y

# Default powerline10k theme, no plugins installed
# RUN sh -c "$(wget -O- https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)"

RUN apt update -y && apt upgrade -y
RUN apt install curl -y

RUN apt install git -y
RUN apt install zsh -y

RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# RUN source /opt/ros/noetic/setup.zsh
# ENV ROS_MASTER_URI=http://nuc:11311/
# RUN zsh./r
WORKDIR /ros_ws/
RUN echo "source /opt/ros/noetic/setup.zsh">> ~/.zshrc
# RUN echo "source /usr/local/zed/workspace/ws-ros1/devel/setup.zsh">> ~/.zshrc
ENV PATH_SCRIPT ${path}
COPY ${PATH_SCRIPT} /Docker
ENTRYPOINT [ "/bin/zsh", "-i" ]
# RUN source /opt/ros/noeti
# ENTRYPOINT [ "bash", "/Docker/script.bash" ]
# ENTRYPOINT ["source", "/opt/ros/noetic/setup.zsh"]