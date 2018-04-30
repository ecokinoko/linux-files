#!/bin/sh
#ros setup

printf "kinetic or indigo: "
read version

sudo sh -c 'echo "deb http://packages.ros.org/ros/ubuntu $(lsb_release -sc) main" > /etc/apt/sources.list.d/ros-latest.list'
sudo apt-key adv --keyserver hkp://ha.pool.sks-keyservers.net:80 --recv-key 421C365BD9FF1F717815A3895523BAEEB01FA116
sudo apt update


sudo apt install -y ros-"$version*"-desktop

sudo rosdep init
rosdep update

echo "source /opt/ros/"$version"/setup.bash" >> .bashrc

source ~/.bashrc
mkdir -p ~/catkin_ws/src
cd ~/catkin_ws/
catkin_init_workspace src
echo "source ~/catkin_ws/devel/setup.bash" >> ~/.bashrc
catkin_make && source ~/catkin_ws/devel/setup.bash
