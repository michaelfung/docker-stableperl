# create a builder environment to build required perl modules for your App
# need to list all require perl modules in cpanfile

# example: docker build -t runtime-builder:stable .

# usage:
# $ docker run -it --mount source=applib,target=/applib --mount type=bind,source=/tmp,target=/localcpan runtime-builder:stable /bin/bash


FROM stableperl:stable

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

# install build tools, 
# install required binary libs,
RUN apt-get update \
    && apt-get install -y git curl build-essential \
    && apt-get install -y libev4 libev-dev libffi6 libffi-dev \
    && apt-get install -y libzmq5 libzmq3-dev \
    && apt-get install -y openssl libssl1.0.0 libssl1.1 libssl-dev libnss3 libnss3-dev

ENV HOME /root
WORKDIR /
COPY entrypoint.sh .

# switch to stableperl,
# install cpanm
ENV PERLBREW_ROOT /usr/local/perlbrew
RUN source /usr/local/perlbrew/etc/bashrc \
    && perlbrew use 5.22.0-1.001 \
    && perlbrew install-cpanm
   
#  && cpanm --installdeps . -M https://cpan.metacpan.org

VOLUME ["/localcpan"]
VOLUME ["/applib"]
ENTRYPOINT ["/entrypoint.sh"]

