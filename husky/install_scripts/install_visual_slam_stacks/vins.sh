cd
cd visualslam_ws/src
git clone https://github.com/catkin/catkin_simple --recursive
git clone https://github.com/ethz-asl/glog_catkin --recursive
git clone https://github.com/ethz-asl/gflags_catkin --recursive
git clone https://github.com/ethz-asl/eigen_catkin --recursive
git clone https://github.com/ethz-asl/cuckoo_time_translator.git --recursive
git clone https://github.com/ethz-asl/maplab_realsense.git --recursive 
sudo apt-get install autoconf -y
sudo apt install ros-kinetic-librealsense -y
sudo apt-get install python-catkin-tools -y

sudo apt-get install libgoogle-glog-dev -y
sudo apt-get install libatlas-base-dev -y 
sudo apt-get install libeigen3-dev -y
sudo apt-get install g++ binutils-gold xorg-dev libglu1-mesa-dev -y
sudo apt-get install libgl1-mesa-dev -y
sudo apt-get autoremove -y
sudo apt-get install mesa-common-dev -y
sudo apt-get install freeglut3-dev freeglut3 -y
sudo apt-get install build-essential -y
sudo apt-get install qt5-default -y
sudo apt-get install qt5-doc -y
sudo apt-get install ros-kinetic-cv-bridge ros-kinetic-tf ros-kinetic-message-filters ros-kinetic-image-transport -y
sudo apt install ros-kinetic-octomap* -y
# CMake
sudo apt-get install cmake -y
# google-glog + gflags
sudo apt-get install libgoogle-glog-dev -y
# BLAS & LAPACK
sudo apt-get install libatlas-base-dev -y
# Eigen3
sudo apt-get install libeigen3-dev -y

#sudo add-apt-repository ppa:bzindovic/suitesparse-bugfix-1319687



sudo apt-get install python-software-properties -y

#sudo add-apt-repository ppa:jmaye/ethz

#sudo apt-get update

sudo apt-get install libsuitesparse-dev -y

sudo apt-get install qt5-doc-html qtbase5-doc-html -y

sudo apt-get install qtbase5-examples -y
cd ..
git clone https://github.com/ceres-solver/ceres-solver 
cd ceres-solver 
mkdir build 
cd build cmake .. 
make -j4 
sudo make install 

cd ~/visualslam_ws
catkin_make
