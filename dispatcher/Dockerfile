FROM centos:latest
MAINTAINER Javier Monje Cerrato
#Befor build the image, put your own config files in /conf/httpd/

#Allow write in /etc/httpd to the apache user
# Install Apache and enable it
RUN yum -y install httpd mod_ssl mod_so mod_security openssl; yum clean all; systemctl enable httpd.service; chown -R apache /etc/httpd/
#Installation Guide: https://helpx.adobe.com/experience-manager/dispatcher/using/dispatcher-install.html
# download dispatcher module
RUN curl -s https://www.adobeaemcloud.com/content/companies/public/adobe/dispatcher/dispatcher/_jcr_content/top/download_9/file.res/dispatcher-apache2.4-linux-x86-64-ssl-4.2.3.tar.gz -O
RUN mkdir dispatcher
RUN tar -C dispatcher -zxvf dispatcher-apache2.*.tar.gz
VOLUME ["/dispatcher/logs"]
VOLUME ["/dispatcher/dispatcher_cache"]
# copy and rename dispatcher module
RUN cp ./dispatcher/dispatcher-apache2.*.so /etc/httpd/modules/
RUN ln -s /etc/httpd/modules/dispatcher-apache2.*.so /etc/httpd/modules/mod_dispatcher.so
#Copy all config files to the image
COPY conf/httpd /etc/httpd
CMD ["-D", "FOREGROUND"]
ENTRYPOINT ["/usr/sbin/httpd"]

