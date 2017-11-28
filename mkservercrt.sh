cd /tmp
wget -c https://github.com/OpenVPN/easy-rsa/archive/master.zip
mv master.zip easy-rsa.zip
unzip easy-rsa.zip
cd /tmp/vpn && mkdir -p openvpn-certs/server
cd /tmp/vpn/openvpn-certs/server
cp -ar /tmp/easy-rsa-master/* .
cd easyrsa3
cp vars.example vars
./easyrsa clean-all
./easyrsa build-ca
./easyrsa build-server-full vpnserver
