#!/bin/sh
echo "THE SCRIPT WILL CREATE A NEW DOCKER MACHINE FOR AEM INSTANCES";
echo -n "Press [ENTER] to continue,...: "
read var_name
docker-machine rm -f default
docker-machine create -d virtualbox  --virtualbox-disk-size "35000" --virtualbox-memory=8192 default
echo "Created docker machine default with 30Gb Disk and 8Gb RAM";
echo "Init Docker Swarm: Dafault machine will be the MANAGER: "
eval $(docker-machine env default)
docker swarm init --advertise-addr $(docker-machine ip default):2377
echo "swarn finished";
eval $(docker-machine env}