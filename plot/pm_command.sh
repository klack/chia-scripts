#!/bin/sh -x
su -c 'sudo plotman plot && watch -n 5 plotman status' user #get around hivos auto root login