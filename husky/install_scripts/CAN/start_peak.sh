clear
sudo modprove pcan
sudo modprobe peak_usb # peak_pci
sudo modprobe can
sudo modprobe can_bcw
sudo modprobe can_raw
sudo ip link set can0 up type can bitrate 500000

#echo " \\\\\\\"


ifconfig 
#echo " \\\\\\\"


cat /proc/pcan

#echo " \\\\\\\"

cat /boot/config-4.4.0-139-generic |grep -i can
#echo " \\\\\\\"
	
tail /var/log/messages


sudo echo <<EOF KERNEL=="pcanusb*", NAME="pcanusb/%n", SYMLINK+="%k", GROUP="plugdev" | sudo tee -a /etc/udev/rules.d/45-pcan.rules
EOF
