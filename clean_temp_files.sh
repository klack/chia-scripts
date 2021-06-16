#!/bin/sh -x
killall -9 rsync
rm -rf /var/run/rsyncd.pid
killall -9 plotter
killall -9 chia
rm -rfv /chia/plotters/1/*
rm -rfv /chia/plotters/2/*
rm -rfv /chia/plotters/3/*
rm -rfv /chia/plotters/4/*
rm -rfv /chia/plotters/5/*
rm -rfv /chia/plotters/6/*
