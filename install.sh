#!/bin/sh -x
logs-off && \
disk-expand && \
timedatectl set-timezone America/Denver && \
sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt install -y nmon iotop util-linux zip unzip

#Install Chia
cd /opt/ && \
sudo git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules && \
cd chia-blockchain && \
sudo sh install.sh && \
. ./activate

#Plotman
pip install --force-reinstall git+https://github.com/ericaltendorf/plotman@main

#Mad Max Plotter
sudo apt remove cmake && \
cd /opt/ && \
wget https://github.com/Kitware/CMake/releases/download/v3.20.4/cmake-3.20.4-linux-x86_64.sh && \
chmod +x ./cmake-3.20.4-linux-x86_64.sh && \
sudo bash ./cmake-3.20.4-linux-x86_64.sh && \

#Chia Scripts
cd /opt/ && \
sudo git clone https://github.com/klack/chia-scripts.git && \
chmod +x /opt/chia-scripts/plotter_daemon/*.sh && \
chmod +x /opt/chia-scripts/farmer_daemon/*.sh

ln -s /opt/chia-blockchain/venv/bin/chia /usr/local/bin/ && \
ln -s /opt/chia-blockchain/venv/bin/plotman /usr/local/bin/

chia init && \
chia keys add