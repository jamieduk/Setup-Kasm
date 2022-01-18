#!/bin/bash
echo "Setting Up Kasm"
echo ""
sudo dd if=/dev/zero bs=1M count-1024 of=/mnt/1GiB.swap
sudo chmod 600 /mnt/1GiB.swap
sudo mkswap /mnt/1GiB.swap
sudo swapon /mnt/1GiB.swap
echo '/mnt/1GiB.swap swap swap defaults 0 0' | sudo tee -a /etc/fstab

wget https://kasm-static-content.s3.amazonaws.com/kasm_release_1.10.0.238225.tar.gz
tar -xf kasm_release*.tar.gz
echo "Which port you want server to run on?"
read port
sudo bash kasm_release/install.sh -L $port

# If you would like to run the Web Application on a different port pass
# the -L flag when calling the installer. e.g 
# sudo bash kasm_release/install.sh -L 8443
