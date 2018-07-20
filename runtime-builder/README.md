# Prerequsite for runtime-builder

## Local CPAN repository

It's good to have a local cpan cache to speed up build process. We will use _pinto_ to maintain the local repo.

We need to maintain a list of required modules. See the _modules.list_ file in this folder.

To get a list of install installed modules:

    perlbrew list-modules


### Get list of required modules from existing scripts

Use [Module::ScanDeps](https://metacpan.org/pod/Module::ScanDeps) to get a list of require modules in existing scripts.


### Setup pinto

Install:

    curl -L http://getpinto.stratopan.com | bash

    # then, put those in ~/.bashrc to ease operation
    alias pinto='pinto --root /data/localcpan'
    source ~/opt/local/pinto/etc/bashrc

Create the repository on a local data folder:

    mkdir /data/localcpan
    pinto init /data/localcpan

Populate the repo with currently installed modules:

    perlbrew list-modules | pinto pull --no-fail --use-default-message
    

## Automate modules installation

We need to maintain a _cpanfile_ for auto installing the modules with cpanm.

[cpanfile Specification](https://metacpan.org/pod/distribution/Module-CPANfile/lib/cpanfile.pod)

Maintain the file manually, or ...

    
## Create library volume 

The builder will install modules into a library volume, which the scripts will use find modules. Example:

    use lib '/applib';
    use Mango;  # installed under /applib

It makes development easy by not requiring a docker rebuild when new modules are required.


create a docker volume:

    docker volume create applib
