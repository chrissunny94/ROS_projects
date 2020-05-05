wget http://www.peak-system.com/fileadmin/media/linux/files/peak-linux-driver-7.4.tar.gz
tar xvf peak-linux-driver-7.4.tar.gz
cd peak-linux-driver-7.4/


#sudo apt-get install libpopt-dev
#tar -xzf peak-linux-driver-8.3_osd3
#cd peak_linux-driver-8.3_osd3/peak-linux-driver-8.3/
make clean
make uninstall
make clean
#make -C driver NET=NETDEV_SUPPORT
#make -C lib NET=NETDEV_SUPPORT
#make -C test NET=NETDEV_SUPPORT
make
sudo make install


