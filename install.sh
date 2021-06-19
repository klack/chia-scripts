#!/bin/sh -x
logs-off && disk-expand
timedatectl set-timezone America/Denver
sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt install -y nmon iotop util-linux zip unzip

cd /opt/ && \
sudo git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules && \
cd chia-blockchain && \
sudo sh install.sh && \
. ./activate && \
chia init && \
chia keys add

#Plotman
pip install --force-reinstall git+https://github.com/ericaltendorf/plotman@main

#Mad Max Plotter
sudo apt remove cmake && \
cd /opt/ && \
wget https://github.com/Kitware/CMake/releases/download/v3.20.4/cmake-3.20.4-linux-x86_64.sh && \
chmod +x ./cmake-3.20.4-linux-x86_64.sh && \
sudo bash ./cmake-3.20.4-linux-x86_64.sh


echo "Finshed, run ~/start_hud.sh to start Plotman"