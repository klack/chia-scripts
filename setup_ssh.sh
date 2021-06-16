#!/bin/sh -x
ssh-keygen -t rsa
ssh-copy-id -i /root/.ssh/id_rsa.pub plotter@192.168.7.201