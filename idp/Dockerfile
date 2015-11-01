# Dockerfile to setup a container with the Shibboleth IDP 

FROM java-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y
RUN apt-get install -y unzip

ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR $CATALINA_HOME

COPY bin/apache-tomcat-7.0.65.tar.gz /tmp/
RUN tar -xvf /tmp/apache-tomcat-7.0.65.tar.gz -C /opt/tomcat --strip-components=1 && \
    rm bin/*.bat && rm /tmp/apache-tomcat-7.0.65.tar.gz

COPY files/tomcat-keystore conf/
COPY files/server.xml conf/
COPY files/catalina.sh bin/

COPY bin/shibboleth-identityprovider-2.4.4-bin.zip /tmp/
WORKDIR /tmp
RUN unzip shibboleth-identityprovider-2.4.4-bin.zip
WORKDIR /tmp/shibboleth-identityprovider-2.4.4

RUN echo "/opt/shibboleth-idp\nidp.ojbc-local.org\npassword" | ./install.sh

RUN find /opt/shibboleth-idp

RUN mkdir -p /opt/tomcat/conf/Catalina/localhost
RUN echo '<Context docBase="/opt/shibboleth-idp/war/idp.war" privileged="true" antiResourceLocking="false" antiJARLocking="false" unpackWAR="false" swallowOutput="true" />' > /opt/tomcat/conf/Catalina/localhost/idp.xml

EXPOSE 9080
EXPOSE 9443
CMD ["catalina.sh", "run"]
