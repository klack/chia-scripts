#!/bin/sh -x
find /chia/dst/* -type 'f' -size -100000M -print -delete
find /chia/tmp/* -type 'f' -size -100000M -print -delete
find /chia/plotters/* -type 'f' -size -100000M -print -delete