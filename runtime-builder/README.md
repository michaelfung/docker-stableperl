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
    
    alias pinto='pinto --root /data/localcpan'
    source ~/opt/local/pinto/etc/bashrc

    mount /data/localcpan
    pinto init /data/localcpan

    perlbrew list-modules | pinto pull --no-fail --use-default-message
    

## cpanfile

We need to maintain a _cpanfile_ for auto installing the modules with cpanm.

[cpanfile Specification](https://metacpan.org/pod/distribution/Module-CPANfile/lib/cpanfile.pod)

Maintain the file manually, or ...

    
### Create library volume 

create a docker volume:

    docker volume create applib
