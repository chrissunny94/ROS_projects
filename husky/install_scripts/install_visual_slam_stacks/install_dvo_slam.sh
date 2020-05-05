mkdir ~/visualslam_ws/src -p
cd ~/visualslam_ws/src
export ROS_PACKAGE_PATH=$ROS_PACKAGE_PATH:~/visualslam_ws/src/dvo_slam
git clone https://github.com/jefftee/dvo_slam.git
rosmake dvo_core dvo_ros dvo_slam dvo_benchmark
cd ..
catkin_make -j1
#roslaunch dvo_slam qucikstart.lauch
