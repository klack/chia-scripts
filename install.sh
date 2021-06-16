#!/bin/sh -x
logs-off && disk-expand
sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt install -y nmon iotop util-linux

cd /opt/ && \
sudo git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules && \
cd chia-blockchain && \
sudo sh install.sh && \
. ./activate && \
chia init && \
chia keys add

pip install --force-reinstall git+https://github.com/ericaltendorf/plotman@main

echo "Finshed, run ~/start_hud.sh to start Plotman"