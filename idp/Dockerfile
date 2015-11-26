# Dockerfile to setup a container with the Shibboleth IDP 

FROM java7-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN apk add --update unzip zip tar

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

RUN printf "/opt/shibboleth-idp\nidp.ojbc.local\npassword" | ./install.sh

WORKDIR /opt/shibboleth-idp/war
RUN mkdir tmp && mv idp.war tmp
WORKDIR /opt/shibboleth-idp/war/tmp
RUN unzip idp.war
COPY files/web.xml WEB-INF/web.xml
RUN zip -f idp.war && mv idp.war ..
WORKDIR /opt/shibboleth-idp/war
RUN rm -rf tmp

COPY ../shared/demostate-ctf.xml /opt/shibboleth-idp/metadata/demostate-ctf.xml

COPY files/attribute-filter.xml /opt/shibboleth-idp/conf/attribute-filter.xml
COPY files/attribute-resolver.xml /opt/shibboleth-idp/conf/attribute-resolver.xml
COPY files/handler.xml /opt/shibboleth-idp/conf/handler.xml
COPY files/login.config /opt/shibboleth-idp/conf/login.config
COPY files/logging.xml /opt/shibboleth-idp/conf/logging.xml
COPY files/relying-party.xml /opt/shibboleth-idp/conf/relying-party.xml

RUN mkdir -p /opt/tomcat/conf/Catalina/localhost
RUN echo '<Context docBase="/opt/shibboleth-idp/war/idp.war" privileged="true" antiResourceLocking="false" antiJARLocking="false" unpackWAR="false" swallowOutput="true" />' > /opt/tomcat/conf/Catalina/localhost/idp.xml

#EXPOSE 9080
#EXPOSE 9443
CMD ["catalina.sh", "run"]
