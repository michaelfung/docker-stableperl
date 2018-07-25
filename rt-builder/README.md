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


## Build tips

Speed up the image build process if you are sure all modules would built without problems:

    docker build --build-arg=PERL_CPANM_OPT="--notest" -t rt-builder:stable .


## Using the image

To build and install some modules into the _opt_ volume:

    docker run -t --rm --mount source=stableperl-opt,target=/opt rt-builder:stable cpanm -M http://localcpan.lan:3111 Some::Module

To build all modules in a list

    export PKGS=`xargs < modules-list`
    docker run -t --rm --mount source=stableperl-opt,target=/opt runtime-builder:stable cpanm -M http://localcpan.lan:3111 $PKGS


## Exporting the perl runtime environment

Use either method below:

1. Build a new image that will copy the _/opt_ folder from this image. See **stableperl-rt**.

2. Export the _/opt/pearbrew_ folder to docker volume:

    docker volume create stabelperl-opt
    docker run -t --rm --mount source=stabelperl-opt-vol,target=/opt rt-builder:stable
