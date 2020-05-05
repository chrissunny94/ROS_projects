# get & install PEAK drivers
wget https://www.peak-system.com/fileadmin/media/linux/files/peak-linux-driver-8.6.0.tar.gz
tar -xzf peak-linux-driver-8.6.0.tar.gz
cd peak-linux-driver-8.6.0

# install required dependencies (peak-driver)
sudo apt-get install libpopt-dev
# build chardev driver
make PCI=NO PCIEC=NO PCC=NO DNG=NO PAR=NO ISA=NO NET=NO_NETDEV_SUPPORT -C driver NET=NETDEV_SUPPORT

sudo make install
sudo modprobe pcan

# check PEAK devices
cat /proc/pcan
