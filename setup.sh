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
