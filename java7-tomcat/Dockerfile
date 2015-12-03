# Dockerfile to build a Tomcat container 

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

CMD ["catalina.sh", "run"]
