FROM java:8
MAINTAINER Javier Monje Cerrato
WORKDIR /
ADD cq-author-p4502.jar cq-author-p4502.jar
COPY /license.properties /license.properties
RUN java -jar cq-author-p4502.jar -unpack