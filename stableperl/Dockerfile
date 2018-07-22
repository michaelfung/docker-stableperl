# build stableperl 
# require the stableperl distribution in ./tmp
# example: docker build -t stableperl:stable .

FROM perlbrew:stable

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /root

# all require perl modules in cpanfile
WORKDIR /
COPY ./tmp/stableperl-5.22.0-1.001.tar.gz /

#
# install binary libs, repeat these in runtime Dockerfile
#
RUN apt-get update \    
    && apt-get install -y libev4 libffi6 \
    && apt-get install -y libzmq5 \
    && apt-get install -y openssl libssl1.0.0 libssl1.1 libnss3

#
# install build tools, and
# build stableperl
#
SHELL ["/bin/bash", "-c"]
ENV PERLBREW_ROOT /opt/perlbrew
RUN apt-get -y install git curl build-essential \
    && perlbrew init \
    && mkdir -p $PERLBREW_ROOT \
    && perlbrew install -j 4 --64int /stableperl-5.22.0-1.001.tar.gz \
    && rm -f stableperl-5.22.0-1.001.tar.gz

#
# install binary libs developement dependencies
#
RUN apt-get update \    
    && apt-get install -y libev-dev libffi-dev \
    && apt-get install -y libzmq3-dev \
    && apt-get install -y libssl-dev libnss3-dev \
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

ENTRYPOINT ["/entrypoint.sh"]
COPY entrypoint.sh .
