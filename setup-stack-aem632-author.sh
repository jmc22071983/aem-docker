#!/bin/sh
echo "******************************************************************************************** "
echo "*********** AEM 6.3.2 SWARM STACK: AUTHOR INSTANCE **************** "
echo "******************************************************************************************** "
eval $(docker-machine env default)
echo "Downloading docker-compose.yml from github ...";
sudo curl -o author.yml  https://raw.githubusercontent.com/jmc22071983/aem-docker/master/aem6.3.2-author.yml
echo "Deploying stack swarm aem ...";
sudo env RUNMODE=$1 docker stack deploy -c author.yml aem632-stack
echo "Wait..., have a coffee until all services be running, mejor vete a dar un paseo..."
echo "Type: * docker service ls * to see the services"
echo "Type: * docker ps * to see the containers"