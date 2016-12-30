#enable SSH
/bin/rm -v /etc/ssh/ssh_host_*
dpkg-reconfigure openssh-server

echo "update"
apt-get update
sleep 5

echo "curl"
apt-get install -y curl
sleep 5

echo "openvpn"
apt-get install -y openvpn 
sleep 5

echo "git"
apt-get install -y git 
sleep 5

echo "bluetooth"
apt-get install -y bluetooth 
sleep 5

echo "bluez"
apt-get install -y bluez 
sleep 5

echo "libbluetooth-dev"
apt-get install -y libbluetooth-dev 
sleep 5

echo "libudev-dev"
apt-get install -y libudev-dev
sleep 5

echo "make"
apt-get install -y make 
sleep 5

echo "gcc"
apt-get install -y gcc 
sleep 5

echo "g++"
apt-get install -y g++ 
sleep 5

echo "build-essential"
apt-get install -y build-essential 
sleep 5

echo "libusb-1.0-0.dev"
apt-get install -y libusb-1.0-0.dev
sleep 5

#node
echo "Install Node JS"
cd ~
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs

sleep 10
#install eth0 stuff
echo "Install eth0 driver"
cd /opt
git clone https://github.com/Denis2222/CHIP_HUMUS.git
cd /opt/CHIP_HUMUS/overlay/
sh ./install.sh

echo "Config BLE"
#Config BLE
systemctl stop bluetooth #stop now
systemctl disable bluetooth #stop for next reboot
hciconfig hci0 up #up right stuff

#node dependency
echo "npm -g bluetooth-hci-socket"
npm install -g bluetooth-hci-socket
sleep 5

echo "npm -g pm2"
npm install -g pm2
sleep 5

echo "Clone Gateway Depo"
git clone https://github.com/Denis2222/Gateway.git
cd Gateway

sleep 5
#Node package install
echo "Install Gateway third-party module"
npm install
sleep 2
#Activate for start at boot. And restart if something goes wrong.
pm2 start elocky --name ./app.js
sleep 2
pm2 startup
#shutdown -r now
