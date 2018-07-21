#!/bin/bash
CMD=$1

# setup stable perl environment
source /usr/local/perlbrew/etc/bashrc
perlbrew use 5.22.0-1.001

exec $CMD ${@:2}
