FROM jmc22071983/aem632p:0.0.1-SNAPSHOT
MAINTAINER Javier Monje Cerrato
WORKDIR /
EXPOSE 4503 8001
ENV RUNMODE="publish"
ENTRYPOINT java -Dfile.encoding=UTF8 -Xmx2048m -agentlib:jdwp=transport=dt_socket,address=8001,server=y,suspend=n -jar ./cq-publish-p4503.jar -r ${RUNMODE}