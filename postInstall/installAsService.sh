#!/bin/bash
# From DOS prompt type (git update-index --chmod=+x installAsService.sh) to make this file executable.
set -e
echo "NPM post install shell that installs this app as service starts now..."
echo "Set irdclient as defalut group for ElderCreek -> sudo chown :irdclient ../ElderCreek"
sudo chown :irdclient ../ElderCreek
echo "Give default group write access to the ElderCreek directory -> sudo chmod g+w ../ElderCreek"
sudo chmod g+w ../ElderCreek
echo "Install D-Bus config file for this service -> sudo cp ./postInstall/dbus.conf /etc/dbus-1/system.d/ElderCreek.conf"
sudo cp ./postInstall/dbus.conf /etc/dbus-1/system.d/ElderCreek.conf
echo "Install systemd service file -> sudo cp -n ./postInstall/server.service /etc/systemd/system/ElderCreek.service"
sudo cp -n ./postInstall/server.service /etc/systemd/system/ElderCreek.service
echo "Enable the servers to start on reboot -> systemctl enable ElderCreek.service"
sudo systemctl enable ElderCreek.service
echo "Start the service now -> systemctl start ElderCreek.service"
sudo systemctl start ElderCreek.service
echo "NPM Post install shell is complete."
echo "To start this servers please reboot the server. After reboot Type -> journalctl -u ElderCreek -f <- to see status."