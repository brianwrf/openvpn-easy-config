mkdir /etc/openvpn
cp /tmp/vpn/openvpn-certs/server/easyrsa3/pki/ca.crt /etc/openvpn/
cp /tmp/vpn/openvpn-certs/server/easyrsa3/pki/dh.pem /etc/openvpn/
cp /tmp/vpn/openvpn-certs/server/easyrsa3/pki/issued/*.crt /etc/openvpn/
cp /tmp/vpn/openvpn-certs/server/easyrsa3/pki/private/*.crt /etc/openvpn/
cd /etc/openvpn/
openssl dhparam -out dh2048.pem 2048
openvpn --genkey --secret ta.key
wget -c https://raw.githubusercontent.com/mattock/mkinline/master/mkinline.sh
chmod +x mkinline.sh
echo 1 > /proc/sys/net/ipv4/ip_forward
sysctl -p
iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j SNAT --to-source 10.0.0.4
iptables -t nat -L -n -v
