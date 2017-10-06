# unix utilities toolbox

Build an alpine based image for general unix tools.

## Build

	docker build -t toolbox:alpine .

## Run adhoc

plain:
	
	docker run -it --rm toolbox:alpine /bin/bash

with a volume:

	docker run -it --rm \
	  --mount source=nginx-conf,target=/etc/nginx \
	  toolbox:alpine /bin/bash

in a network:

	docker run -it --rm \
      --net=vlanbridge \
	  --mount source=nginx-conf,target=/etc/nginx \
	  toolbox:alpine /bin/bash


## Create container

create and run:

    docker run -it \
      --name toolbox \
      --net=vlanbridge \
      toolbox:alpine /bin/bash

run later:

    docker start -ai toolbox
