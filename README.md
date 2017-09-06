# docker-stableperl

Marc Lehmann's stableperl

## Prepare

### Build on VM

#### install require packages
apt-get install -y libev4 libev-dev libffi6 libffi-dev
apt-get install -y libzmq5 libzmq3-dev

export PERLBREW_ROOT=/usr/local/perlbrew
perl --version
curl -L https://install.perlbrew.pl | bash
source /usr/local/perlbrew/etc/bashrc
perlbrew install -j 4 --64int  /home/mike/Downloads/stableperl-5.22.0-1.001.tar.gz

perlbrew use 5.22.0-1.001

cpanm --installdeps . -M https://cpan.metacpan.org

## Config

## Usage
