# build stableperl and required modules for App
# example: docker build -t stableperl:1.0 .

FROM perlbrew:1.0

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /root

# all require perl modules in cpanfile
WORKDIR /
COPY stableperl-5.22.0-1.001.tar.gz /

# install build tools, and
# build stableperl
SHELL ["/bin/bash", "-c"]
ENV PERLBREW_ROOT /usr/local/perlbrew
RUN	apt-get -y install git curl build-essential \
	&& perlbrew init \
	&& mkdir -p $PERLBREW_ROOT \
	&& perlbrew install -j 4 --64int /stableperl-5.22.0-1.001.tar.gz \
	&& rm -f stableperl-5.22.0-1.001.tar.gz
