#!/bin/sh -x
nohup plotman plot >> /var/log/plotman.log 2>&1 &
su -c 'sudo plotman plot' user 