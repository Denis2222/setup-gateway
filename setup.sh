apt-get update

apt-get install -y curl openvpn git bluetooth bluez libbluetooth-dev libudev-dev make gcc g++ build-essential libusb-1.0-0.dev

#node
cd ~
curl -sL https://deb.nodesource.com/setup_6.x | sudo -E bash -
apt-get install -y nodejs


#install eth0 stuff
cd /opt
git clone https://github.com/KoljaWindeler/CHIP_HUMUS.git 
cd /opt/CHIP_HUMUS/overlay/
sh ./install.sh

#Config BLE
systemctl stop bluetooth #stop now
systemctl disable bluetooth #stop for next reboot
hciconfig hci0 up #up right stuff


npm install -g bluetooth-hci-socket
npm install -g forever
npm install -g forever-service

#Clone depo
git clone https://github.com/Denis2222/Gateway.git

cd Gateway

#Node package install
npm install

#Activate for start at boot. And restart if something goes wrong.
forever-service install elocky-config --script ./app.js
shutdown -r now
