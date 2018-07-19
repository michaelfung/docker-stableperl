# build to basic perlbrew image
# example: docker build -t perlbrew:1.0 .

FROM debian:stable-slim

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /root

RUN apt-get update \
	&& apt-get -y install perlbrew
