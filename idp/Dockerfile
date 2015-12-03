# Dockerfile to setup a container with the Shibboleth IDP 

FROM java7-tomcat

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN apk add --update unzip zip tar

COPY bin/shibboleth-identityprovider-2.4.4-bin.zip /tmp/
WORKDIR /tmp
RUN unzip shibboleth-identityprovider-2.4.4-bin.zip
WORKDIR /tmp/shibboleth-identityprovider-2.4.4

RUN printf "/opt/shibboleth-idp\nidp.ojbc.local\npassword" | ./install.sh

WORKDIR /opt/shibboleth-idp/war
RUN mkdir tmp && mv idp.war tmp
WORKDIR /opt/shibboleth-idp/war/tmp
RUN unzip idp.war
COPY files/web.xml WEB-INF/web.xml
RUN zip -f idp.war && mv idp.war ..
WORKDIR /opt/shibboleth-idp/war
RUN rm -rf tmp

COPY files/demostate-ctf.xml /opt/shibboleth-idp/metadata/demostate-ctf.xml

COPY files/attribute-filter.xml /opt/shibboleth-idp/conf/attribute-filter.xml
COPY files/attribute-resolver.xml /opt/shibboleth-idp/conf/attribute-resolver.xml
COPY files/handler.xml /opt/shibboleth-idp/conf/handler.xml
COPY files/login.config /opt/shibboleth-idp/conf/login.config
COPY files/logging.xml /opt/shibboleth-idp/conf/logging.xml
COPY files/relying-party.xml /opt/shibboleth-idp/conf/relying-party.xml

RUN mkdir -p /opt/tomcat/conf/Catalina/localhost
RUN echo '<Context docBase="/opt/shibboleth-idp/war/idp.war" privileged="true" antiResourceLocking="false" antiJARLocking="false" unpackWAR="false" swallowOutput="true" />' > /opt/tomcat/conf/Catalina/localhost/idp.xml

CMD ["catalina.sh", "run"]
