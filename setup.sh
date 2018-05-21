sudo apt-get update
sudo apt-get upgrade
sudo apt-get update

read -p "Homebridge setup: press any key to begin... " -n1 -s
wget -O - https://raw.githubusercontent.com/sdesalas/node-pi-zero/master/install-node-v.lts.sh | bash
npm install -g homebridge
npm install -g homebridge-camera-rpi

#cp ./CameraSource.js /opt/nodejs/lib/node_modules/homebridge-camera-rpi/CameraSource.js

sudo apt-get install ffmpeg
sudo modprobe bcm2835-v4l2
sudo echo "bcm2835-v4l2" >> /etc/modules

read -p "Press any key to continue... " -n1 -s
sudo mkdir -p /var/lib/homebridge/
sudo chown -R pi /var/lib/homebridge
sudo cp ./config.json /var/lib/homebridge/
sudo cp ./homebridge.service /etc/systemd/system/homebridge.service

read -p "Press any key to start homebridge.service... " -n1 -s
sudo systemctl daemon-reload
sudo systemctl enable homebridge
sudo systemctl start homebridge
