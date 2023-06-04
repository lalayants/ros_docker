ARG BASE_IMG

FROM ${BASE_IMG}
SHELL ["/bin/bash", "-c"]

# Timezone Configuration
ENV TZ=Europe/Moscow
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

ENV DEBIAN_FRONTEND=noninteractive

ARG ROS1_DISTRO

RUN apt update
RUN apt install -y zsh vim nano inetutils-ping tmux zsh gnupg
RUN apt install -y curl wget git lsb-release curl ca-certificates

# ROS1 Install
RUN sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
RUN curl -s https://raw.githubusercontent.com/ros/rosdistro/master/ros.asc | apt-key add -
RUN apt update
RUN apt install -y ros-$ROS1_DISTRO-ros-base
RUN echo "source /opt/ros/$ROS1_DISTRO/setup.bash">> ~/.bashrc
RUN echo "source /opt/ros/$ROS1_DISTRO/setup.zsh">> ~/.zshrc
RUN apt install -y python3-wstool build-essential 
RUN apt install -y python3-rosdistro python3-catkin-pkg python3-rospkg 
RUN apt install -y python3-rosinstall python3-rosinstall-generator
RUN apt install -y python3-rosdep
RUN rosdep init && rosdep update

# Install ROS1 Dependency
RUN apt update
RUN apt install -y python3-catkin-tools
RUN apt install -y ros-$ROS1_DISTRO-tf
RUN apt install -y ros-$ROS1_DISTRO-pcl-conversions
RUN apt install -y ros-$ROS1_DISTRO-cv-bridge
RUN apt install -y ros-$ROS1_DISTRO-filters
RUN apt install -y ros-$ROS1_DISTRO-rviz ros-$ROS1_DISTRO-xacro
RUN apt install -y ros-$ROS1_DISTRO-joy ros-$ROS1_DISTRO-robot-state-publisher
RUN apt install -y ros-$ROS1_DISTRO-rqt ros-$ROS1_DISTRO-rqt-reconfigure
RUN apt install -y ros-$ROS1_DISTRO-joint-state-publisher-gui
RUN apt install -y ros-$ROS1_DISTRO-image-geometry
RUN apt install -y ros-$ROS1_DISTRO-rtabmap
RUN apt install -y ros-$ROS1_DISTRO-rtabmap-ros

# Navigation dependency
RUN apt install -y ros-$ROS1_DISTRO-scan-tools
RUN apt install -y ros-$ROS1_DISTRO-realsense2-camera
RUN apt install -y ros-$ROS1_DISTRO-realsense2-description
RUN apt install -y ros-$ROS1_DISTRO-openslam-gmapping
RUN apt install -y ros-$ROS1_DISTRO-ecl-threads
RUN apt install -y ros-$ROS1_DISTRO-robot-localization
RUN apt install -y ros-$ROS1_DISTRO-move-base
RUN apt install -y ros-$ROS1_DISTRO-amcl
RUN apt install -y ros-$ROS1_DISTRO-map-server
RUN apt install -y ros-$ROS1_DISTRO-global-planner
RUN apt install -y ros-$ROS1_DISTRO-dwa-local-planner

# Python pip
RUN apt install python3-pip -y
RUN pip3 install PyOpenGL PyOpenGL_accelerate

# Oh My ZSH
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

WORKDIR /ros_ws
RUN echo 'roslaunch realsense2_camera rs_camera.launch enable_infra1:=true enable_infra2:=true enable_gyro:=true enable_accel:=true unite_imu_method:=linear_interpolation' >> start_rs.sh
RUN chmod +x start_rs.sh

CMD  [ "zsh" ]
