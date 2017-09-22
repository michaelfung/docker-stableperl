# sample web app


## Persistence

Host folder `/opt/docker-vols/sample-app` map to container's `/app` folder.


## Networking with bridge to physical LAN

Use macvlan bridge instead of default docker bridge for performance.

Create a macvlan VLAN which is bridged to the physical LAN subnet at 192.168.0.0/24:
	
	IFNAME=enp0s17
	docker network create \
	  -d macvlan \
	  --subnet=192.168.0.0/24 \
	  --gateway=192.168.0.1 \
	  --ip-range=192.168.0.192/28 \
	  -o parent=${IFNAME} \
	  vlanbridge

Start app in with network connected to macvlan VLAN:
	docker run \
	  --net=vlanbridge --ip=192.168.0.193 \
	  -v /opt/docker-vols/sample-app:/app \
	  --name webapp3 \
	  --restart "on-failure:3" \
	  -d sample-app:1.0 start

	docker run \
	  --net=vlanbridge --ip=192.168.0.194 \
	  -v /opt/docker-vols/sample-app:/app \
	  --name webapp4 \
	  --restart "on-failure:3" \
	  -d sample-app:1.0 start

Now we can connect to app from any host on the physical LAN.


## Networking with Isolated VLAN

Create macvlan vlan254, subnet: 10.254.1.0/24

Create vlan iface, vlan tag 254:

	IFNAME=enp0s17
	ip link add link ${IFNAME} name ${IFNAME}.254 type vlan id 254
	# Add gateway ip to host iface:
	ip addr add 10.254.1.1/24 brd 10.254.1.255 dev ${IFNAME}.254 
	ip link set dev ${IFNAME}.254 up
	

Create docker network vlan254:	

	docker network create \
	  -d macvlan \
	  --subnet=10.254.1.0/24 \
	  --gateway=10.254.1.1 \
	  -o parent=${IFNAME}.254 \
	  vlan254

All containers attached to this vlan can communicate with each other.

	docker run \
	  --net=vlan254 \
	  -v /opt/docker-vols/sample-app:/app \
	  --name webapp1 \
	  --restart "on-failure:3" \
	  -d sample-app:1.0 start
   
	docker run \
	  --net=vlan254 \
	  -v /opt/docker-vols/sample-app:/app \
	  --name webapp2 \
	  --restart "on-failure:3" \
	  -d sample-app:1.0 start
	  
	docker exec webapp1 ping -c 5 webapp2  # test connectivity

## Deploy with Docker Compose

Create a `docker-compose.yml` file: reference the one in this folder.

Run with custom project name:

	docker-compose -p webservice up -d

Run 4 instance of the web app:

	docker-compose -p webservice up -d --scale web=4


Now, any instance in vlan254 can reach them by name like:

	ping -c 5 webservice_web_3

