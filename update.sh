#!/bin/sh -x
cd /opt/chia-scripts/
git fetch origin master
git reset --hard origin/master
find /opt/chia-scripts/ -iname '*.sh' -print -exec chmod 755 {} \;
