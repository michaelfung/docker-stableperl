# Prerequsite for runtime-builder

## Local CPAN repository

It's good to have a local cpan cache to speed up build process. We will use _pinto_ to maintain the local repo.

We need to maintain a list of required modules. See the _modules.list_ file in this folder.

To get a list of install installed modules:

    perlbrew list-modules


### Get list of required modules from existing scripts

Use [Module::ScanDeps](https://metacpan.org/pod/Module::ScanDeps) to get a list of require modules in existing scripts.


### Setup pinto

For the time being, install pinto outside of docker

Install:

    curl -L http://getpinto.stratopan.com | bash

    # then, put those in ~/.bashrc to ease operation
    alias pinto='pinto --root /data/localcpan'
    source ~/opt/local/pinto/etc/bashrc

Create the repository on a local data folder:

    mkdir /data/localcpan
    pinto init

Edit the repository options at */data/localcpan/.pinto/config/pinto.ini* .

Populate the repo with currently installed modules:

    perlbrew list-modules | pinto pull --no-fail --use-default-message
    

## Automate modules installation

We need to maintain a _cpanfile_ for auto installing the modules with cpanm.

[cpanfile Specification](https://metacpan.org/pod/distribution/Module-CPANfile/lib/cpanfile.pod)

Maintain the file manually, or ...

    
## Create library volume 

The builder will install modules into a library volume, under the _perl_ folder, which the scripts will use to find modules. Example:

    use local::lib '/applib/perl';
    use Some::Module;  # installed by "cpanm -l /applib/perl Some::Module"

It makes development easy by not requiring a docker image rebuild whenever new modules are required.

create a docker volume:

    docker volume create applib


## Build some modules

To build and install some modules into the _applib_ volume, in an ad-hoc fashion:

    docker run -it --rm --mount source=applib,target=/applib runtime-builder:stable cpanm -l /applib Modern::Perl Test::More

