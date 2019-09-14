#!/bin/sh
echo "******************************************************************************************** "
echo "*********** AEM 6.5 SWARM STACK: AUTHOR, PUBLISH AND DISPATCHER INSTANCES **************** "
echo "******************************************************************************************** "
env docker swarm init
echo "Downloading docker-compose.yml from github ...";
curl -o aem6.5-complete.yml  https://raw.githubusercontent.com/jmc22071983/aem-docker/master/aem6.5-author-publish-dispatcher.yml
read -p "Enter the AEM runmode: " run_mode
echo "Deploying stack swarm aem ...";
env RUNMODE=$run_mode docker-compose -f aem6.5-complete.yml up