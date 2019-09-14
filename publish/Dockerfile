FROM aem6.5-publish-base:0.0.1
MAINTAINER Javier Monje Cerrato
WORKDIR /
EXPOSE 4503
ENV RUNMODE="publish"
CMD java -Xms4g -Xmx4g -Djava.awt.headless=true -Xdebug -Xnoagent -agentlib:jdwp=transport=dt_socket,address=8001,server=y,suspend=n -jar ./cq-publish-p4503.jar -p 4503 -r ${RUNMODE} -v -nofork