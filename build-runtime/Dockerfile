# build required modules for App
# example: docker build -t runtime-builder:1.0 .

FROM stableperl:1.0

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

# install build tools, 
# install required binary lib,
RUN apt-get update \
    && apt-get install -y git curl build-essential \
    && apt-get install -y libev4 libev-dev libffi6 libffi-dev \
    && apt-get install -y libzmq5 libzmq3-dev \
    && apt-get install -y openssl libssl1.0.2 libssl1.1 libssl-dev libnss3 libnss3-dev

# switch to stableperl,
# use cpanm to install modules
# all require perl modules in cpanfile
ENV HOME /root
WORKDIR /
SHELL ["/bin/bash", "-c"]
ENV PERLBREW_ROOT /usr/local/perlbrew
COPY cpanfile /
RUN source /usr/local/perlbrew/etc/bashrc \
    && perlbrew use 5.22.0-1.001 \
    && perlbrew install-cpanm \
    && cpanm --installdeps . -M https://cpan.metacpan.org
    
