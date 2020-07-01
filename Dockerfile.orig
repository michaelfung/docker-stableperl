FROM debian9:0.1

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /root
ENV PERLBREW_ROOT /usr/local/perlbrew
ENV PERLBREW_HOME /root/.perlbrew

RUN apt-get update \
	&& apt-get -y upgrade \
	&& apt-get -y install git curl build-essential perl \
	&& mkdir -p /usr/local/perlbrew /root \
	&& umask 0022 \
	&& curl -kL http://install.perlbrew.pl | bash
	
ENV PATH /usr/local/perlbrew/bin:$PATH
ENV PERLBREW_PATH /usr/local/perlbrew/bin

