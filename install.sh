#!/usr/bin/env bash

echo "Making the shell scripts executeable."
chmod +x plsd.sh
chmod +x x729-pwr.sh
chmod +x x729-fan.sh
chmod +x x729-softsd.sh

echo "Copying shell scripts"
sudo cp -f ./plsd.sh /usr/local/bin
sudo cp -f ./x729-pwr.sh /usr/local/bin
sudo cp -f ./x729-fan.sh /usr/local/bin
sudo cp -f ./x729-softsd.sh /usr/local/bin

echo "Copying service files."
sudo cp -f plsd.service /lib/systemd/system
sudo cp -f x729-pwr.service /lib/systemd/system
sudo cp -f x729-fan.service /lib/systemd/system

echo "Reloading system daemon."
sudo systemctl daemon-reload

echo "Enabling services for auto start."
sudo systemctl enable plsd
sudo systemctl enable x729-pwr
sudo systemctl enable x729-fan

echo "Starting services."
sudo systemctl start plsd
sudo systemctl start x729-pwr
sudo systemctl start x729-fan

echo "Setting up software shutdown."
echo "alias x729off='sudo /usr/local/bin/x729-softsd.sh'" >> ~/.bashrc
source ~/.bashrc
