#!/bin/sh
echo "THE SCRIPT WILL CREATE A NEW DOCKER MACHINE FOR AEM INSTANCES";
echo -n "Press [ENTER] to continue,...: "
read var_name
docker-machine create -d virtualbox  --virtualbox-disk-size "30000" --virtualbox-memory=8192 aem1
echo "Created docker machine aem1 with 30Gb Disk and 8Gb RAM";
echo "Init Docker Swarm: Dafault machine will be the MANAGER: "
eval $(docker-machine env default)
docker swarm init --advertise-addr $(docker-machine ip default):2377
TOKEN=$(docker swarm join-token -q worker)
echo "Docker machine aem1 will be the worker"
eval $(docker-machine env aem1)
docker swarm join --token $TOKEN $(docker-machine ip default):2377
echo "swarn finished";