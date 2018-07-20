# docker-stableperl

Build a stable perl environment for development and deployment, using 
Marc Lehmann's stableperl as an example.

# structure

Image dependency layers:

| runtime |
	|
| runtime-builder |
	|
| stableperl |
	|
| perlbrew |
	|
| ubuntu  |


# Steps

## ubuntu

We just use Docker privided image of Ubuntu 18.04 LTS.

	docker pull ubuntu:bionic

## perlbrew

Provide perlbrew and build essentials. Though results in bigger image, 
must use system provided perlbrew, otherwise cannot start perlbrew in 
runtime (missing modules).

It is the first step to creating the builder image.

## stableperl

Compile the stableperl tarball here.
To provide bare stableperl without addidtional modules.

## runtime-builder

Create a builder environment to build required perl modules and other stuff.
Don't care the image size.

## runtime

Copy the built modules and related stuff from **runtime-builder**


## Config


## Usage

See sample-app

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
