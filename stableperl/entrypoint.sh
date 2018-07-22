#!/bin/bash
CMD=$1

# setup stable perl environment
source /opt/perlbrew/etc/bashrc
perlbrew use 5.22.0-1.001

exec $CMD ${@:2}
