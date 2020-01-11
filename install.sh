cd /tmp
rm -rf /tmp/vpn
mkdir vpn
cd vpn
wget -c https://build.openvpn.net/downloads/releases/openvpn-2.3.8.tar.gz
tar -xvf openvpn-2.3.8.tar.gz
cd /tmp/vpn
wget -c http://www.oberhumer.com/opensource/lzo/download/lzo-2.09.tar.gz
tar -xvf lzo-2.09.tar.gz
apt install libtool-bin
libtool --finish /usr/local/lzo/lib
apt-get install libpam0g-dev
apt-get install libssl-dev
apt-get install liblzo2-dev
cd /tmp/vpn/openvpn-2.3.8
./configure
make 
make check
make install
