# Setup-Kasm
Deploy a kasm to debian
https://kasmweb.com/kasmvnc.html

https://youtu.be/U7e-mcJdZok


git clone https://github.com/jamieduk/Setup-Kasm.git


Use Auto Installer Script

sudo chmod +x *.sh

./Setup.sh



~~

Manually Setup from Master

git clone https://github.com/kasmtech/KasmVNC.git

Auto installer

wget https://github.com/kasmtech/KasmVNC/releases/download/v0.9.2-beta/kasmvncserver_ubuntu_bionic_0.9.2_amd64.deb

sudo dpkg -i kasmvncserver_*.deb
sudo apt-get -f install

# We provide an example script to run KasmVNC at #
# /usr/share/doc/kasmvncserver/examples/kasmvncserver-easy-start. It runs a VNC
# server on display :10 and on interface 0.0.0.0. If you're happy with those
# defaults you can just use it as is:
sudo ln -s /usr/share/doc/kasmvncserver/examples/kasmvncserver-easy-start /usr/bin/

# Add your user to the ssl-cert group
sudo addgroup $USER ssl-cert
# You will need to re-connect in order to pick up the group change

# Create ~/.vnc directory and corresponding files.
kasmvncserver-easy-start -d && kasmvncserver-easy-start -kill

# Modify vncstartup to launch your environment of choice, in this example LXDE
# This may be optional depending on your system configuration
echo '/usr/bin/lxsession -s LXDE &' >> ~/.vnc/xstartup

# Start KasmVNC with debug logging:
kasmvncserver-easy-start -d

# Tail the logs
tail -f ~/.vnc/`hostname`:10.log

Now navigate to your system at https://[ip-address]:8443/

To stop a running KasmVNC:

kasmvncserver-easy-start -kill





