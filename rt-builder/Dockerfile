# create a builder environment to build required perl modules for your App
# need to list all require perl modules in cpanfile

# example: docker build -t rt-builder:buster .
# speed up if you sure modules will build ok:
# $ docker build --build-arg=PERL_CPANM_OPT="--notest" -t rt-builder:stable .

# inspection usage:
# $ docker run -it --rm --mount source=opt,target=/opt rt-builder:stable /bin/bash

FROM stableperl:buster

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /root
WORKDIR /

#
# install build tools,
# install required binary libs,
#
RUN apt-get update \
    && apt-get install -y git curl build-essential \
    && apt-get install -y libev4 libev-dev libffi6 libffi-dev \
    && apt-get install -y libzmq5 libzmq3-dev \
    && apt-get install -y openssl libssl1.1 libssl-dev libnss3 libnss3-dev \
    && apt-get install -y zlib1g zlib1g-dev \
    && apt-get clean && rm -rf /var/lib/apt/lists/*  # cleanup to save space

#
# switch to stableperl, and install modules
#
ARG PERL_CPANM_OPT
ENV PERLBREW_ROOT /opt/perlbrew
COPY modules-list /

#RUN source /opt/perlbrew/etc/bashrc \
#    && perlbrew use 5.22.0-1.001 \
#    && xargs < modules-list | cpanm --no-man-pages \
#    && rm -rf /opt/perlbrew/build \
#    && rm -f /opt/perlbrew/*log

#
# setup docker run entry
#
COPY entrypoint.sh .
COPY build.sh .
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/build.sh"]

#
# export /opt/perlbrew for inspection
#
VOLUME ["/opt/perlbrew"]
