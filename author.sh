#!/bin/sh
echo "RUNNING AEM-Author Instance-SP:3.2.2";
docker run -e RUNMODE=$1 --rm -v aem632-author:/crx-quickstart/repository -v /aem632-author/logs:/crx-quickstart/logs  -p 4502:4502 -p 8000:8000 jmc22071983/aem632-author:0.0.9-SNAPSHOT