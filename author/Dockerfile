FROM jmc22071983/aem632:0.0.1-SNAPSHOT
MAINTAINER Javier Monje Cerrato
WORKDIR /
EXPOSE 4502 8000
ENV RUNMODE="author"
ENTRYPOINT java -Dfile.encoding=UTF8 -Xmx2048m -agentlib:jdwp=transport=dt_socket,address=8000,server=y,suspend=n -jar ./cq-author-p4502.jar -r ${RUNMODE}