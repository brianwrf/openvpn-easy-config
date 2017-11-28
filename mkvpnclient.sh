cd /tmp/vpn/openvpn-certs/server/easyrsa3
./easyrsa build-client-full <vpnclient>
cp /tmp/vpn/openvpn-certs/server/easyrsa3/pki/issued/<vpnclient>.crt /etc/openvpn/
cp /tmp/vpn/openvpn-certs/server/easyrsa3/pki/private/<vpnclient>.key /etc/openvpn/
cd /etc/openvpn/
./mkinline.sh -i client.conf -o <client_name>.ovpn
