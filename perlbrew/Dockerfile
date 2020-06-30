# build a perlbrew enabled image
# example: docker build -t perlbrew:stable .

FROM debian:buster

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

ENV DEBIAN_FRONTEND noninteractive

ENV HOME /root
ENV PERLBREW_ROOT /opt/perlbrew
RUN apt-get update \
    && apt-get -y install perlbrew \
    && \curl -L https://install.perlbrew.pl | bash \
    && apt-get clean && rm -rf /var/lib/apt/lists/*  # cleanup to save space
