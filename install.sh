cd /tmp
mkdir vpn
cd vpn
wget -c http://test.avfisher.win/xsstest/upload/openvpn-2.3.8.tar.gz
tar -xvf openvpn-2.3.8.tar.gz
cd /tmp/vpn
wget -c http://www.oberhumer.com/opensource/lzo/download/lzo-2.09.tar.gz
tar -xvf lzo-2.09.tar.gz
apt install libtool-bin
libtool --finish /usr/local/lzo/lib
apt-get install libpam0g-dev
cd /tmp/vpn/openvpn-2.3.8
./configure
make 
make check
make install
