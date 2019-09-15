#!/bin/sh
echo "******************************************************************************************** "
echo "*********** AEM 6.5 SWARM STACK: AUTHOR, PUBLISH AND DISPATCHER INSTANCES **************** "
echo "******************************************************************************************** "
echo "Creating volume directories..."
env mkdir C:/aem-dispatcher-volume
env mkdir C:/aem65-author-volume
env mkdir C:/aem65-publish-volume
env docker swarm init
echo "Downloading compose: aem65-complete.yml from github ...";
curl -o aem65-complete.yml  https://raw.githubusercontent.com/jmc22071983/aem-docker/master/aem6.5-author-publish-dispatcher.yml
read -p "Enter the AEM runmode yo watn run AEM instance (For exaple: auhtor, publish, stg, local...): " run_mode
echo "Deploying stack swarm aem ...";
env RUNMODE=$run_mode docker stack deploy -c aem65-complete.yml aem65-stack