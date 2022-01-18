#!/bin/bash
echo "Change 1 to 0 and save and exit, enter to continue..."
read Y
sudo nano /etc/default/apport
sudo systemctl disable apport
sudo apt purge apport
echo "All Done!"
