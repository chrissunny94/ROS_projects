sudo apt install ros-kinetic-kobuki* -y
mkdir ~/turtlebot_ws/src -p
cd ~/turtlebot_ws/src
git clone --recursive https://github.com/turtlebot/turtlebot
git clone --recursive https://github.com/turtlebot/turtlebot_apps
git clone --recursive https://github.com/turtlebot/turtlebot_simulator
git clone --recursive https://github.com/turtlebot/turtlebot_viz
git clone --recursive https://github.com/turtlebot/turtlebot_msgs
git clone --recursive https://github.com/yujinrobot/kobuki_description 
cd ..
catkin_make
echo "source ~/turtlebot_ws/devel/setup.bash" >> ~/.bashrc
source ~/.bashrc
