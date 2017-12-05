rm -rf /etc/openvpn
mkdir /etc/openvpn
cp server.conf /etc/openvpn
cp client.conf /etc/openvpn
cp mkvpnclient.sh /etc/openvpn
cp mkinline.sh /etc/openvpn
cp /tmp/vpn/openvpn-certs/server/easyrsa3/pki/ca.crt /etc/openvpn/
cp /tmp/vpn/openvpn-certs/server/easyrsa3/pki/issued/*.crt /etc/openvpn/
cp /tmp/vpn/openvpn-certs/server/easyrsa3/pki/private/*.key /etc/openvpn/
cd /etc/openvpn/
openssl dhparam -out dh2048.pem 2048
openvpn --genkey --secret ta.key
sysctl -p
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j SNAT --to-source <local_IP>
iptables -A INPUT -p icmp -j DROP
iptables -t nat -L -n -v
iptables -L -n -v

