cd /tmp/vpn/openvpn-certs/server/easyrsa3
./easyrsa build-client-full client
cp /tmp/vpn/openvpn-certs/server/easyrsa3/pki/issued/client.crt /etc/openvpn/
cp /tmp/vpn/openvpn-certs/server/easyrsa3/pki/private/client.key /etc/openvpn/
cd /etc/openvpn/
./mkinline.sh -i client.conf -o <client_name>.ovpn
