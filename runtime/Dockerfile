# build the runtime image
# example: docker build -t stableperl-rt:1.0 .

FROM runtime-builder:1.0 as builder 


FROM deb9-base:1.0
MAINTAINER "Michael Fung <hkuser2001@gmail.com>"
ENV DEBIAN_FRONTEND noninteractive

# install required packages
RUN apt-get update \
	&& apt-get install -y libev4 libev-dev libffi6 libffi-dev \
	&& apt-get install -y libzmq5 libzmq3-dev \
	&& mkdir -p /usr/local/perlbrew/bin \
	&& mkdir -p /usr/local/perlbrew/etc \
	&& mkdir -p /usr/local/perlbrew/perls

# install perlbrew
ENV HOME /root
ENV PERLBREW_ROOT /usr/local/perlbrew
SHELL ["/bin/bash", "-c"]
RUN apt-get install -y perlbrew \
	&& perlbrew init
	
# copy stableperl and modules from builder	
COPY --from=builder /usr/local/perlbrew/bin/ /usr/local/perlbrew/bin/
COPY --from=builder /usr/local/perlbrew/etc/ /usr/local/perlbrew/etc/
COPY --from=builder /usr/local/perlbrew/perls/ /usr/local/perlbrew/perls/


