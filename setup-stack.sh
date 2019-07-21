#!/bin/sh
echo "THE SCRIPT WILL CREATE A NEW DOCKER MACHINE";
echo -n "Press [ENTER] to continue,...: "
read var_name
docker-machine create -d virtualbox  --virtualbox-disk-size "30000" --virtualbox-memory=8192 aem
echo "Created docker machine aem-node1 with 30Gb Disk and 8Gb RAM";
eval $(docker-machine env aem)
docker swarm init --advertise-addr $(docker-machine ip aem):2377
echo "swarn finished";