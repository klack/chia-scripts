#!/bin/sh -x
logs-off && \
disk-expand && \
timedatectl set-timezone America/Denver && \
sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt install -y nmon iotop util-linux zip unzip libsodium-dev cmake g++ git

#Install Chia
cd /opt/ && \
sudo git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules && \
cd chia-blockchain && \
sudo sh install.sh && \
. ./activate && \
ln -s /opt/chia-blockchain/venv/bin/chia /usr/local/bin/

#Plotman
pip install --force-reinstall git+https://github.com/ericaltendorf/plotman@main

#MadMax Plotter
cd /opt/ && \
sudo git clone https://github.com/madMAx43v3r/chia-plotter.git && \
cd chia-plotter && \
git submodule update --init && \
./make_devel.sh && \
./build/chia_plot --help

#Chia Scripts
cd /opt/ && \
sudo git clone https://github.com/klack/chia-scripts.git && \
sudo chmod +x /opt/chia-scripts/plotter_daemon/*.sh && \

#Farmer Daemon
sudo chmod +x /opt/chia-scripts/farmer_daemon/*.sh
chia init && \
chia keys add

#Plotter Daemon
sudo chmod +x /opt/chia-scripts/farmer_daemon/*.sh && \
sudo cat /opt/chia-scripts/crontab >> /etc/crontab && \
ln -s /opt/chia-blockchain/venv/bin/plotman /usr/local/bin/ && \
ln -s /opt/chia-plotter/build/chia_plot /usr/local/bin/

#cmake
# sudo apt remove cmake && \
# cd /opt/ && \
# wget https://github.com/Kitware/CMake/releases/download/v3.20.4/cmake-3.20.4-linux-x86_64.sh && \
# chmod +x ./cmake-3.20.4-linux-x86_64.sh && \
# sudo bash ./cmake-3.20.4-linux-x86_64.sh && \