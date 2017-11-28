# openvpn-easy-config
It is only for Ubuntu.

## Install
* git clone https://github.com/brianwrf/openvpn-easy-config
* cd openvpn-easy-config/
* ./install.sh

## Configuration
### Generate CA and server certificate
* ./mkservercrt.sh

### Generate client certificate
* ./mkclientcrt.sh

### Config
* ./configure.sh
* cp server.conf /etc/openvpn
* cp client.conf /etc/openvpn
* cp mkvpnclient.sh /etc/openvpn
* cd /etc/openvpn
* vim server.conf
  * Change `port <port>` to your own listen port
* vim client.conf
  * Change `remote <remote_server> <port>` to your own remote server IP or domain and listen port
 
 ### Generate VPN client connection file
 * cd /etc/openvpn
 * ./mkvpnclient.sh
 
 ## Running
 ### Server Side
 * cd /etc/openvpn
 * openvpn --config server.conf
 
 ### Client Side
 #### Linux
 * Install OpenVPN
 * Run command `openvpn client.ovpn`
 
 #### Windows
 * Install OpenVPN client for Windows
 * Copy `client.ovpn` file into `C:\Program Files\OpenVPN\Config`
 * Open OpenVPN client to connect
