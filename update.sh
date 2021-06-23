#!/bin/sh -x
git fetch origin master
git reset --hard origin/master
sudo chmod +x /opt/chia-scripts/*.sh && \
sudo chmod +x /opt/chia-scripts/farm/*.sh
sudo chmod +x /opt/chia-scripts/plot/*.sh