# openvpn-easy-config
It is for Ubuntu ONLY.

## Install
```
git clone https://github.com/brianwrf/openvpn-easy-config
cd openvpn-easy-config/
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
./configure.sh
cp server.conf /etc/openvpn
cp client.conf /etc/openvpn
cp mkvpnclient.sh /etc/openvpn
cp mkinline.sh /etc/openvpn
cd /etc/openvpn
vim server.conf // Change `port <port>` to your own listen port
vim client.conf // Change `remote <remote_server> <port>` to your own remote server IP or domain and listen port
```
 
 ### Generate VPN client connection file
 ```
 cd /etc/openvpn
 vim mkvpnclient.sh // Change `./mkinline.sh -i client.conf -o <client_name>.ovpn` to your own VPN client file name
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
