#!/bin/sh
echo "******************************************************************************************** "
echo "*********** AEM 6.3.2 SWARM STACK: AUTHOR, PUBLISH AND DISPATCHER INSTANCES **************** "
echo "******************************************************************************************** "
eval $(docker-machine env aem1)
echo "Downloading docker-compose.yml from github ...";
curl -o docker-compose.yml  https://raw.githubusercontent.com/jmc22071983/aem-docker/master/docker-compose.yml
echo "Deploying stack swarm aem ...";
docker stack deploy -c docker-compose.yml aem632-stack
echo "Wait..., have a coffee until all services be running"