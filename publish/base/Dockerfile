FROM java:8
MAINTAINER Javier Monje Cerrato
WORKDIR /
ADD cq-publish-p4503.jar cq-publish-p4503.jar
COPY /license.properties /license.properties
RUN java -jar cq-publish-p4503.jar -unpack