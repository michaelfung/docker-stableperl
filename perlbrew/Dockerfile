# build to basic perlbrew image
# example: docker build -t perlbrew-base:1.0 .

FROM deb9-base:1.0

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /root

RUN apt-get update \
	&& apt-get -y upgrade \
	&& apt-get -y install git curl build-essential perl \
	&& apt-get -y install perlbrew
