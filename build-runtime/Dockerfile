# build stableperl and required modules for App
# example: docker build -t runtime-builder:1.0 .

FROM perlbrew-base:1.0

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /root
#ENV PERLBREW_HOME /root/.perlbrew
#ENV PATH /usr/local/perlbrew/bin:$PATH

# all require perl modules in cpanfile
WORKDIR /
COPY cpanfile /
COPY stableperl-5.22.0-1.001.tar.gz /

# build stableperl
SHELL ["/bin/bash", "-c"]
ENV PERLBREW_ROOT /usr/local/perlbrew
RUN	perlbrew init \
	&& mkdir -p $PERLBREW_ROOT \
	&& perlbrew install -j 4 --64int /stableperl-5.22.0-1.001.tar.gz

# install required packages and build perl modules
RUN apt-get update \
	&& apt-get install -y libev4 libev-dev libffi6 libffi-dev \
	&& apt-get install -y libzmq5 libzmq3-dev \
	&& apt-get install -y openssl libssl1.0.2 libssl1.1 libssl-dev libnss3 libnss3-dev
	
# install perl modules	
RUN source /usr/local/perlbrew/etc/bashrc \
	&& perlbrew use 5.22.0-1.001 \
	&& perlbrew install-cpanm \
	&& cpanm --installdeps . -M https://cpan.metacpan.org
