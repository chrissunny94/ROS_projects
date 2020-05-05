sudo apt-get install ros-kinetic-cv-bridge ros-kinetic-tf ros-kinetic-message-filters ros-kinetic-image-transport

mkdir ~/dependencies
cd ~/dependencies
git clone https://github.com/jluttine/suitesparse
git clone https://ceres-solver.googlesource.com/ceres-solver
cd suitesparse
sudo make install

#cd GraphBLAS/build ; cmake .. ; make ; cd ../Demo ; ./demo 
#cd ../build ; sudo make install
cd ..

cd ceres-solver



# CMake
sudo apt-get install cmake -y
# google-glog + gflags
sudo apt-get install libgoogle-glog-dev -y
# BLAS & LAPACK
sudo apt-get install libatlas-base-dev -y
# Eigen3
sudo apt-get install libeigen3-dev -y

sudo apt install ros-kinetic-octomap* -y
#sudo add-apt-repository ppa:bzindovic/suitesparse-bugfix-1319687



sudo apt-get install python-software-properties -y

#sudo add-apt-repository ppa:jmaye/ethz

#sudo apt-get update

sudo apt-get install libsuitesparse-dev -y

#mkdir ceres-bin
#cd ceres-bin
#cmake ../ceres-solver-1.14.0
#make -j3
#make test

#sudo make install

#cd ..
mkdir build
cd build
cmake ..
sudo make install


mkdir ~/visualslam_ws/src -p
cd ~/visualslam_ws/src
git clone https://github.com/HKUST-Aerial-Robotics/VINS-Mono.git


cd ..
catkin_make
source ~/visualslam_ws/devel/setup.bash

