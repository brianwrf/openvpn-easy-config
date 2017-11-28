# openvpn-easy-config
It is for Ubuntu ONLY.

## Install
```
git clone https://github.com/brianwrf/openvpn-easy-config
cd openvpn-easy-config/
chmod +x *.sh
./install.sh
```

## Configuration
### Generate CA and server certificate
```./mkservercrt.sh```

### Generate client certificate
```./mkclientcrt.sh```

### Config
```
vim /etc/sysctl.conf // Uncommend `net.ipv4.ip_forward = 0` and change to `net.ipv4.ip_forward = 1`
vim configure.sh // Change `iptables -t nat -A POSTROUTING -s 10.8.0.0/24 -j SNAT --to-source <local_IP>` to your own local IP
./configure.sh
cd /etc/openvpn
vim server.conf // Change `port <port>` to your own listen port
vim client.conf // Change `remote <remote_server> <port>` to your own remote server IP or domain and listen port
```
 
 ### Generate VPN client connection file
 #### For Single VPN client
 ```
 cd /etc/openvpn
 ./mkinline.sh -i client.conf -o client.ovpn
 ```
 
 #### For Multiple VPN clients
 ```
 cd /etc/openvpn
 vim mkvpnclient.sh 
 /*
   - Change `./easyrsa build-client-full <vpnclient>` to a different client name
   - Change `cp /tmp/vpn/openvpn-certs/server/easyrsa3/pki/issued/<vpnclient>.crt /etc/openvpn/` with the same client mame as above
   - Change `cp /tmp/vpn/openvpn-certs/server/easyrsa3/pki/private/<vpnclient>.key /etc/openvpn/` with the same client mame as above
   - Change `./mkinline.sh -i client.conf -o <client_name>.ovpn` to a different VPN client file name
 */
 vim client.conf
 /*
   - Change `cert /etc/openvpn/vpnclient.crt` to `cert /etc/openvpn/<client name as same as last step>.crt`
   - Change `key /etc/openvpn/vpnclient.key` to `key /etc/openvpn/<client name as same as last step>.key`
 */
 ./mkvpnclient.sh
 ```
 
 ## Running
 ### Server Side
 ```
 cd /etc/openvpn
 openvpn --config server.conf
 ```
 
 ### Client Side
 #### Linux
 * Install [OpenVPN](https://openvpn.net/index.php/download/community-downloads.html)
 * Run command `openvpn client.ovpn`
 
 #### Windows
 * Install [OpenVPN](https://openvpn.net/index.php/download/community-downloads.html)
 * Copy `<client_name>.ovpn` file into `C:\Program Files\OpenVPN\Config`
   * Change `<client_name>.ovpn` to your own VPN client file name
 * Open OpenVPN client to connect
