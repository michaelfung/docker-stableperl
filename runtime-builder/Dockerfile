# create a builder environment to build required perl modules for your App
# need to list all require perl modules in cpanfile

# example: docker build -t runtime-builder:stable .

# usage:
# $ docker run -it --rm --mount source=applib,target=/applib runtime-builder:stable

FROM stableperl:stable

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

VOLUME ["/applib"]

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
    && apt-get install -y openssl libssl1.0.0 libssl1.1 libssl-dev libnss3 libnss3-dev

#
# switch to stableperl,
# install cpanm
# and install the "local::lib" module
#
ENV PERLBREW_ROOT /usr/local/perlbrew
RUN source /usr/local/perlbrew/etc/bashrc \
    && perlbrew use 5.22.0-1.001 \
    && perlbrew install-cpanm \
    && cpanm local::lib

ENTRYPOINT ["/entrypoint.sh"]
CMD ["/build.sh"]

COPY entrypoint.sh .
COPY build.sh .
