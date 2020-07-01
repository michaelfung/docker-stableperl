# Prerequsite for runtime-builder

## Local CPAN repository

It's good to have a local cpan cache to speed up build process. We will use _pinto_ to maintain the local repo.

We need to maintain a list of required modules. See the _modules-list_ file in this folder.

To get list of required modules from existing scripts, Use [Module::ScanDeps](https://metacpan.org/pod/Module::ScanDeps) to get a list of require modules in existing scripts.


To get a list of install installed modules:

    perlbrew list-modules


### Setup pinto

For the time being, install pinto outside of docker, even on another machine.

Install:

    curl -L http://getpinto.stratopan.com | bash

    # then, put those in ~/.bashrc to ease operation
    alias pinto='pinto --root /data/localcpan'
    source ~/opt/local/pinto/etc/bashrc

Create the repository on a local data folder:

    mkdir /data/localcpan
    pinto init

Edit the repository options at */data/localcpan/.pinto/config/pinto.ini* .

Populate the repo with required modules:

    cat modules-list | pinto pull --no-fail --use-default-message

Serve the repository with _pintod_ :

    pintod --root /data/localcpan



## Using the image

First create a volume to hold /opt/perlbrew:

    docker volume create opt-perlbrew-stableperl

Start a shell with the image to make it populate the volume

    docker run -it --rm --mount source=opt-perlbrew-stableperl,target=/opt/perlbrew rt-builder:buster /bin/bash


To build and install some modules into the _opt_ volume:

    docker run -t --rm --mount source=opt-perlbrew-stableperl,target=/opt/perlbrew rt-builder:buster cpanm --no-man-pages Some::Module

    # using Pinto:
    #docker run -t --rm --mount source=opt-perlbrew-stableperl,target=/opt/perlbrew rt-builder:stable cpanm -M http://localcpan.lan:3111 Some::Module



To build all modules in a list

    export PKGS=`xargs < modules-list`
    docker run -t --rm --mount source=stableperl-opt,target=/opt/perlbrew runtime-builder:stable cpanm -M http://localcpan.lan:3111 $PKGS


## Exporting the perl runtime environment

Use either method below:

1. Build a new image that will copy the _/opt/perlbrew_ folder from this image. See **stableperl-rt**.

2. Export the _/opt/pearbrew_ folder to docker volume:

    docker volume create opt-perlbrew-stableperl
    docker run -t --rm --mount source=opt-perlbrew-stableperl,target=/opt/perlbrew rt-builder:buster
