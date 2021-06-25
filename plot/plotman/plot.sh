#!/bin/sh -x
su -c 'sudo nohup plotman plot >> ~/plotman.log 2>&1 &' user  #get around hivos auto root login
