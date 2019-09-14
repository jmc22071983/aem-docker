FROM aem6.5-author-base:0.0.1
MAINTAINER Javier Monje Cerrato
WORKDIR /
EXPOSE 4502
ENV RUNMODE="author"
CMD java -Xms4g -Xmx4g -Djava.awt.headless=true -Xdebug -Xnoagent -agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n -jar ./cq-author-p4502.jar -p 4502 -r ${RUNMODE} -v -nofork