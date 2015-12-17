# Dockerfile to build a Tomcat container 

FROM ojbc/java7-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN apk add --update unzip zip tar curl

ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR /tmp

RUN curl -O https://www.apache.org/dist/tomcat/tomcat-7/v7.0.67/bin/apache-tomcat-7.0.67.tar.gz && \
	tar -xvf /tmp/apache-tomcat-7.0.67.tar.gz -C /opt/tomcat --strip-components=1 && \
    rm $CATALINA_HOME/bin/*.bat && rm /tmp/apache-tomcat-7.0.67.tar.gz

WORKDIR $CATALINA_HOME

COPY files/tomcat-keystore conf/
COPY files/server.xml conf/
COPY files/catalina.sh bin/

CMD ["catalina.sh", "run"]
