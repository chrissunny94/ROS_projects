sudo apt-get install build-essential cmake pkg-config -y
sudo apt-get install libx11-dev libatlas-base-dev -y
sudo apt-get install libgtk-3-dev libboost-python-dev -y
sudo apt-get install python-dev python-pip python3-dev python3-pip
sudo -H pip2 install -U pip numpy
sudo -H pip3 install -U pip numpy

cd ~/dependencies
wget http://dlib.net/files/dlib-19.6.tar.bz2
tar xvf dlib-19.6.tar.bz2
cd dlib-19.6/
mkdir build
cd build
cmake ..
cmake --build . --config Release
sudo make install
sudo ldconfig
cd ..

cd 
