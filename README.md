# docker-stableperl

Build a stable perl environment for development and deployment, using
Marc Lehmann's [stableperl](http://software.schmorp.de/pkg/stableperl.html) as an example.

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
To provide bare stableperl without additional modules.

## rt-builder

Create a builder environment to build required perl modules and other stuff.
Don't care the image size.

## stableperl-rt

Copy the built modules and related stuff from **rt-builder**


## Config


## Usage

See sample-app

## Reference
