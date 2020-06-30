# build the runtime image
# example: docker build -t stableperl-rt:stable .

FROM rt-builder:stable as builder

FROM debian:buster

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"
ENV DEBIAN_FRONTEND noninteractive

#
# exclude doc and man pages from packages
#
COPY 01_nodoc /etc/dpkg/dpkg.cfg.d/01_nodoc

#
# install required binary libs
#
RUN apt-get update \
    && apt-get install -y curl ca-certificates less procps lsof \
    && apt-get install -y libev4 libffi6 \
    && apt-get install -y libzmq5 libzmq3-dev \
    && apt-get install -y openssl libssl1.1 libnss3 \
    && apt-get install -y zlib1g \
    && apt-get clean && rm -rf /var/lib/apt/lists/*  # cleanup to save space

#
# install perlbrew depended perl modules, and set folders struct for import
#
ENV HOME /root
ENV PERLBREW_ROOT /opt/perlbrew
SHELL ["/bin/bash", "-c"]
RUN apt-get update \
    && apt-get install -y libcapture-tiny-perl libcpan-perl-releases-perl libdevel-patchperl-perl liblocal-lib-perl \
    && mkdir -p /opt/perlbrew \
    && mkdir -p /usr/share/perl5/App \
    && apt-get clean && rm -rf /var/lib/apt/lists/*  # cleanup to save space

#
# copy perlbrew binary from builder
#
COPY --from=builder /usr/bin/perlbrew /usr/bin/perlbrew
COPY --from=builder /usr/share/perl5/App/perlbrew.pm /usr/share/perl5/App/perlbrew.pm

#
# copy stableperl and modules from builder
#
COPY --from=builder /opt/perlbrew/ /opt/perlbrew/

#
# setup docker run entry
#
COPY entrypoint.sh .
ENTRYPOINT ["/entrypoint.sh"]
CMD ["/bin/bash"]

#
# export /opt for inspection and developement
#
VOLUME ["/opt/perlbrew"]
