#!/bin/sh
docker-machine rm -f default
echo "Deleted docker machine default";
docker-machine create -d virtualbox  --virtualbox-disk-size "30000" --virtualbox-memory=8192 default
echo "Created docker machine default with 30Gb Disk and 8Gb RAM";
docker swarm init --advertise-addr $(docker-machine ip default):2377
