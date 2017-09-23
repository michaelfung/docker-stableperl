# Nginx proxy

## Build

	docker build -t deb9-nginx:stable .

## Deploy

### SSL

Put config, key and cert in host file system.

Bind the container's config folder `/etc/nginx` to host file system.

Mount the container's rootfs read only.


### Run

	docker run -d \
	  --network=vlanbridge \
	  --name=ngnix \
	  --tmpfs=/run:rw,noexec,nosuid,size=64k \
	  deb9-nginx:stable


```json

        "GraphDriver": {
            "Data": {
                "LowerDir": "/var/lib/docker/overlay2/f440e6b52921fd526c36170820e1ca1530ec3f09e32d9a398dc7c4061bcc9f94-init/diff:/var/lib/docker/overlay2/b1d466157341b938ab2585e5867feaafb90799338407491b7ae510e9474a9b52/diff:/var/lib/docker/overlay2/ad8b1c3d5ac37228da03d0114a2679af912b98cdfcb154cc20d41359549a921c/diff:/var/lib/docker/overlay2/142ebc2a873ff7ce093f392e23da780716042f0652da78d7b1ad8f95378753f7/diff:/var/lib/docker/overlay2/b4e9ce489df7ee451fea9efe67466379b719051290b7086de1081d8636cd20f8/diff",
                "MergedDir": "/var/lib/docker/overlay2/f440e6b52921fd526c36170820e1ca1530ec3f09e32d9a398dc7c4061bcc9f94/merged",
                "UpperDir": "/var/lib/docker/overlay2/f440e6b52921fd526c36170820e1ca1530ec3f09e32d9a398dc7c4061bcc9f94/diff",
                "WorkDir": "/var/lib/docker/overlay2/f440e6b52921fd526c36170820e1ca1530ec3f09e32d9a398dc7c4061bcc9f94/work"
            },
            "Name": "overlay2"
        },
        "Mounts": [
            {
                "Type": "volume",
                "Name": "7934356bf69e3354637392d9af3cc9043f671bac2aa7fa3a8c6306f24ce0313c",
                "Source": "/var/lib/docker/volumes/7934356bf69e3354637392d9af3cc9043f671bac2aa7fa3a8c6306f24ce0313c/_data",
                "Destination": "/etc/nginx",
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            },
            {
                "Type": "volume",
                "Name": "51cb221867b47a7c43ffd478e7e7dab842fede5d6b895dc089335899fdad4c47",
                "Source": "/var/lib/docker/volumes/51cb221867b47a7c43ffd478e7e7dab842fede5d6b895dc089335899fdad4c47/_data",
                "Destination": "/var/www/html",
                "Driver": "local",
                "Mode": "",
                "RW": true,
                "Propagation": ""
            }

```
