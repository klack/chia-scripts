#!/bin/sh -x
mv /chia/tmp/1/*.plot /chia/dst/
mv /chia/tmp/2/*.plot /chia/dst/
find /chia/dst/* -type 'f' -size -100000M -print -delete
find /chia/tmp/* -type 'f' -print -delete
find /chia/plotters/* -type 'f' -print -delete