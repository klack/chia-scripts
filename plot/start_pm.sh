#!/bin/sh -x
sh -c '/opt/chia-scripts/plot/pm_plot.sh;exec bash'
screen -dm -c /opt/chia-scripts/plot/plotman.screen
