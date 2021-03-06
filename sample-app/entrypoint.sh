#!/bin/bash
# $0 is a script name,
# $1, $2, $3 etc are passed arguments
# $1 is our command
CMD=$1

source /opt/perlbrew/etc/bashrc
perlbrew use 5.22.0-1.001

# set Mojo params:
export APP_PORT
export LIBEV_FLAGS=4
export MOJO_MAX_MESSAGE_SIZE=16384   # default is 10485760 (10MB)
export MOJO_MAX_WEBSOCKET_SIZE=8192


case "$CMD" in
  "dev" )
    export MOJO_MODE=development
    exec /usr/bin/env perl /app/myweb.pl daemon -l "http://*:${APP_PORT}"
    ;;

  "start" )
    # we can modify files here, using ENV variables passed in
    # "docker create" command. It can't be done during build process.
    export MOJO_MODE=production
    exec /usr/bin/env perl /app/myweb.pl daemon -l "http://*:${APP_PORT}"
    ;;

   * )
    # Run custom command. Thanks to this line we can still use
    # "docker run our_image /bin/bash" and it will work
    exec $CMD ${@:2}
    ;;
esac
