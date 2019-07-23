#!/bin/sh
echo "RUNNING AEM-Publish Instance-SP:3.2.2 ..."
docker run -d -e RUNMODE=$1 --rm -v aem632-publish:/crx-quickstart/repository -v /aem632-publish/logs:/crx-quickstart/logs -p 4503:4503 -p 8001:8001 jmc22071983/aem632-publish:0.0.5-SNAPSHOT 
eval $(docker-machine env default)
echo "RUNNING Dispatcher..."
DEFAULTIP=$(docker-machine ip default)
docker run --rm -it -v /aem-dispatcher/logs:/etc/httpd/logs -v aem-dispatcher:/etc/httpd/dispatcher_cache -e AEM_HOST=$DEFAULTIP -e AEM_PORT=4503 -p 80:80 -p 443:443 jmc22071983/dispatcher:0.0.1
