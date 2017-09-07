# docker-stableperl

Marc Lehmann's stableperl

# structure

Image dependency layers:

| runtime |
| runtime-builder |
| perlbrew-base |
| deb9-base |


# Steps

## deb9-base

image name: deb9-base:1.0-170917

boot into deb9 and run the mkimage script:

	cd /usr/share/docker-ce/contrib
	sudo ./mkimage.sh -t deb9-base:1.0-170917 debootstrap stretch

## perlbrew-base

Provide perlbrew and build essentials.

## runtime-builder

Don't care the size.

## runtime

Copy the perl binaries from **runtime-builder**


## Config


## Usage


## Reference

### Build on VM

apt-get install -y libev4 libev-dev libffi6 libffi-dev
apt-get install -y libzmq5 libzmq3-dev

export PERLBREW_ROOT=/usr/local/perlbrew
perl --version
curl -L https://install.perlbrew.pl | bash
source /usr/local/perlbrew/etc/bashrc
perlbrew install -j 4 --64int  /home/mike/Downloads/stableperl-5.22.0-1.001.tar.gz

perlbrew use 5.22.0-1.001

cpanm --installdeps . -M https://cpan.metacpan.org
