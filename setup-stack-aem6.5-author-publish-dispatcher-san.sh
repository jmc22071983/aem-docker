#!/bin/sh
echo "******************************************************************************************** "
echo "*********** AEM 6.5 SWARM STACK: AUTHOR, PUBLISH AND DISPATCHER INSTANCES ****************** "
echo "******************************************************************************************** "
echo "Creating the node manager SWARM...";
env docker swarm init
echo "Creating directories 'dispatcher, author and publish  in /mnt/sda1/aem to persist AEM author and publish logs and Dispatcher cache files"
mkdir /mnt/sda1/aem
mkdir /mnt/sda1/aem/dispatcher
mkdir /mnt/sda1/aem/author
mkdir /mnt/sda1/aem/publish
echo "Downloading compose: aem65-complete-san.yml from github ...";
curl -o aem65-complete-san.yml  https://raw.githubusercontent.com/jmc22071983/aem-docker/master/aem6.5-author-publish-dispatcher-san.yml
read -p "Enter the run mode you want to boot the AEM author instance (For example: author, local, or empty for default config...): " run_mode_auth
read -p "Enter the run mode you want to boot the AEM publish instance (For example: publish, stg, or empty for default config ...): " run_mode_pub
echo "Deploying stack swarm AEM6.5 ...";
env RUNMODEAUT=${run_mode_auth:-author} RUNMODEPUB=${run_mode_pub:-publish} docker stack deploy -c aem65-complete-san.yml aem65-stack
echo "******************************************************************************************** ";
echo "Tip 'docker service ls' to see the services";
echo "Tip 'docker ps' to see the docker containers";
echo "For more info go to 'https://docs.docker.com/engine/swarm/'";
echo "********************************************************************************************";
echo "You can see the author logs in C:/aem65-author-volume";
echo "You can see the publish logs in C:/aem65-publish-volume";
echo "You can see the dispatcher logs and cached files in C:/aem-dispatcher-volume";
echo "********************************************************************************************";
echo "IMPORTANT: If you are deploying the stack for the first time you will have to wait longer since it is necessary to download all the Docker images from the repository.";
echo "This process can take at least 20 minutes depending on your internet speed.";
echo "Wait until the deployment of the AEM stack is finished.";
echo "The process will be finished when you see 1/1 replicas for each container. Type 'docker service ls' to check it.";
echo "When the deployment is complete: ";
echo "	Open a shell script and tip 'docker machine ls' to see your manager machine ip. This IP is your 'host.docker' .";
echo "	type 'host.docker:4502' in your browser to see AEM author instance.";
echo "	type 'host.docker:4503' in your browser to see AEM publish instance.";
echo "	type 'host.docker' in your browser to see Apache Dispatcher instance.";
echo "********************************************************************************************";
echo "If your environment is slow, improve the hardware assigned to docker if is possible.";
echo "Otherwise you can remove any of the services with 'docker service rm <id_service>'.";
echo "or scale it to 0: type 'docker service scale <servicename>=<desire_count>, example: aem65-stack-san_aem65-author=0'.";
echo "********************************************************************************************";