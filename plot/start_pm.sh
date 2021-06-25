#!/bin/sh -x
su -c '/opt/chia-scripts/plot/pm_plot.sh' user
screen -dm -c /opt/chia-scripts/plot/plotman.screen
