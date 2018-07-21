FROM alpine

MAINTAINER "Michael Fung <hkuser2001@gmail.com>"

RUN apk update \
	&& apk add bash \
	&& apk add wget curl \
	&& apk add nano \
	&& apk add openssl openssh-client \
	&& apk add bind-tools \
	&& apk add iperf3 \
	&& apk add grep \
	&& apk add rsync lftp 

CMD ["/bin/bash"]
