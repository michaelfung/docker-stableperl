#!/bin/bash

cat <<EOT
#
# How to update or add perl modules
#

# run the builder with the perlbrew volume
    docker run -it --rm --mount source=perlbrew,target=/opt/perlbrew stableperl-rt-builder /bin/bash

# setup env
    source /opt/perlbrew/etc/bashrc
    perlbrew use perl-5.22.0-1.001

# Install or update needed modules with cpanm:
    cpanm -M http://localcpan.lan:3111 --no-man-pages Some::Module

EOT


exit 0;
