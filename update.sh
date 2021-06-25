#!/bin/sh -x
git fetch origin master
git reset --hard origin/master
find /opt/chia-scripts/ -iname '*.sh' -print -exec chmod 755 {} \;
