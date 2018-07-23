#!/bin/bash

source /opt/perlbrew/etc/bashrc

# start building modules with cpanm

echo "xargs < modules-list | cpanm -M http://localcpan.lan:3111 2> /tmp/builderr.log"

echo "done bulding modules."

exit 0;


