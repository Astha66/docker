# Dockerfile for a Tomcat container with the ojbc-web-util webapp installed

FROM ojbc/java7-tomcat

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

COPY bin/ojb-web-util.war /opt/tomcat/webapps/

CMD ["catalina.sh", "run"]
