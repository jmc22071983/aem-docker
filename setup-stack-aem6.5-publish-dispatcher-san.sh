#!/bin/sh
echo "******************************************************************************************** "
echo "*********** AEM 6.5 SAN SWARM STACK: AUTHOR, PUBLISH AND DISPATCHER INSTANCES **************** "
echo "******************************************************************************************** "
echo "Creating directories to persist AEM logs and cache Dispatcher files"
env mkdir C:/aem-dispatcher-volume
env mkdir C:/aem65-author-volume
env mkdir C:/aem65-publish-volume
echo "Creating the node manager SWARM...";
env docker swarm init
echo "Downloading compose: aem65-complete-san.yml from github ...";
curl -o aem65-complete-san.yml  https://raw.githubusercontent.com/jmc22071983/aem-docker/master/aem6.5-author-publish-dispatcher-san.yml
read -p "Enter the run mode you want to boot the AEM instances (For example: author, publish, stg, local...): " run_mode
echo "Deploying stack swarm AEM6.5 ...";
env RUNMODE=$run_mode docker stack deploy -c aem65-complete-san.yml aem65-stack-san
echo "******************************************************************************************** ";
echo "Tip 'docker service ls' to see the services";
echo "Tip 'docker ps' to see the docker containers";
echo "********************************************************************************************";