# build a perlbrew enabled image
# example: docker build -t perlbrew:stable .

FROM ubuntu:bionic

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /root

RUN apt-get update \
	&& apt-get -y install perlbrew
