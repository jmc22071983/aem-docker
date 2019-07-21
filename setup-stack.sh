#!/bin/sh
echo "THE SCRIPT WILL CREATE A NEW DOCKER MACHINE";
echo -n "Press [ENTER] to continue,...: "
read var_name
docker-machine create -d virtualbox  --virtualbox-disk-size "30000" --virtualbox-memory=8192 aem-node1
echo "Created docker machine default with 30Gb Disk and 8Gb RAM";
docker swarm init --advertise-addr $(docker-machine ip aem-node1):2377
