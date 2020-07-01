# build stableperl
# require the stableperl distribution in ./tmp
# example: docker build -t stableperl:stable .
# example: docker build -t stableperl:buster .

# Inspection usage:
# docker run -it --rm stableperl:buster /bin/bash

FROM perlbrew:buster

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /root

# all require perl modules in cpanfile
WORKDIR /
COPY ./tmp/stableperl-5.22.0-1.001.tar.gz /

#
# install build tools, and
# build stableperl
#
SHELL ["/bin/bash", "-c"]
ENV PERLBREW_ROOT /opt/perlbrew
RUN apt-get update \
    && apt-get -y install git curl build-essential \
    && source /opt/perlbrew/etc/bashrc \
    && perlbrew --version \
    && perlbrew install -j 4 --64int /stableperl-5.22.0-1.001.tar.gz \
    && rm -f stableperl-5.22.0-1.001.tar.gz \
    && apt-get clean && rm -rf /var/lib/apt/lists/*  # cleanup to save space

#
# switch to stableperl,
# install cpanm
# and install the "local::lib" module
#
RUN source /opt/perlbrew/etc/bashrc \
    && perlbrew use 5.22.0-1.001 \
    && perlbrew install-cpanm \
    && cpanm local::lib

COPY entrypoint.sh .
ENTRYPOINT ["/entrypoint.sh"]
