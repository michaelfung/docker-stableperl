#!/bin/bash
CMD=$1

source /usr/local/perlbrew/etc/bashrc
perlbrew use 5.22.0-1.001

exec $CMD
