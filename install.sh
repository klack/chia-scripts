#!/bin/sh -x
logs-off && \
disk-expand && \
timedatectl set-timezone America/Denver && \
sudo apt-get update && \
sudo apt-get upgrade -y && \
sudo apt install -y nmon iotop util-linux zip unzip libsodium-dev cmake g++ git

#cmake
sudo apt remove -y cmake && \
cd /opt/ && \
wget https://github.com/Kitware/CMake/releases/download/v3.20.4/cmake-3.20.4-linux-x86_64.sh && \
chmod +x ./cmake-3.20.4-linux-x86_64.sh && \
sudo bash ./cmake-3.20.4-linux-x86_64.sh && \
ln -s /opt/cmake-3.20.4-linux-x86_64/bin/* /usr/local/bin/

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
find /opt/chia-scripts/ -iname '*.sh' -print -exec chmod 755 {} \;

#Install Chia
cd /opt/ && \
sudo git clone https://github.com/Chia-Network/chia-blockchain.git -b latest --recurse-submodules && \
cd chia-blockchain && \
sudo sh install.sh && \
. ./activate && \
ln -s /opt/chia-blockchain/venv/bin/chia /usr/local/bin/ && \
chia init && \
chia keys add

#Plotman
pip install --force-reinstall git+https://github.com/ericaltendorf/plotman@main && \
cp /opt/chia-scripts/plot/plotman/plotman.yaml /home/user/.config/plotman/

#----------------------

#Plotter Setup
mkdir -p /chia/tmp/1 /chia/tmp/2 /chia/dst && \
cat /opt/chia-scripts/plot/crontab | sudo tee -a /etc/crontab && \
ln -s /opt/chia-blockchain/venv/bin/plotman /usr/local/bin/ && \
ln -s /opt/chia-plotter/build/chia_plot /usr/local/bin/

#SSH
ssh-keygen -t rsa && \
ssh-copy-id -i /root/.ssh/id_rsa.pub plotter@192.168.7.240

#Farmer Setup
cat /opt/chia-scripts/farm/crontab | sudo tee -a /etc/crontab
