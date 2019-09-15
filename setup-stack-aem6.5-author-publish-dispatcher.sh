#!/bin/sh
echo "******************************************************************************************** "
echo "*********** AEM 6.5 SWARM STACK: AUTHOR, PUBLISH AND DISPATCHER INSTANCES **************** "
echo "******************************************************************************************** "
echo "Creating directories 'aem-dispatcher-volume, aem65-author-volume and aem65-publish-volume in C:/ ' to persist AEM logs and Dispatcher cache files..."
env mkdir C:/aem-dispatcher-volume
env mkdir C:/aem65-author-volume
env mkdir C:/aem65-publish-volume
echo "Creating the node manager SWARM...";
env docker swarm init
echo "Downloading compose: aem65-complete.yml from github ...";
curl -o aem65-complete.yml  https://raw.githubusercontent.com/jmc22071983/aem-docker/master/aem6.5-author-publish-dispatcher.yml
read -p "Enter the run mode you want to boot the AEM author instance (For example: author, local, ...): " run_mode_auth
read -p "Enter the run mode you want to boot the AEM publish instance (For example: publish, stg, ...): " run_mode_pub
echo "Deploying stack swarm AEM6.5 ...";
env RUNMODEAUT=$run_mode_auth RUNMODEPUB=$run_mode_pub docker stack deploy -c aem65-complete.yml aem65-stack
echo "******************************************************************************************** ";
echo "Tip 'docker service ls' to see the services";
echo "Tip 'docker ps' to see the docker containers";
echo "For more info go to 'https://docs.docker.com/engine/swarm/'";
echo "********************************************************************************************";