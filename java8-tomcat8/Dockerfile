#
# Unless explicitly acquired and licensed from Licensor under another license, the contents of
# this file are subject to the Reciprocal Public License ("RPL") Version 1.5, or subsequent
# versions as allowed by the RPL, and You may not copy or use this file in either source code
# or executable form, except in compliance with the terms and conditions of the RPL
#
# All software distributed under the RPL is provided strictly on an "AS IS" basis, WITHOUT
# WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, AND LICENSOR HEREBY DISCLAIMS ALL SUCH
# WARRANTIES, INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
# PARTICULAR PURPOSE, QUIET ENJOYMENT, OR NON-INFRINGEMENT. See the RPL for specific language
# governing rights and limitations under the RPL.
#
# http://opensource.org/licenses/RPL-1.5
#
# Copyright 2012-2016 Open Justice Broker Consortium
#

# Dockerfile to build a Tomcat 8 container running on Java 8

FROM ojbc/java8-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN apk add --update unzip zip tar curl

ENV CATALINA_HOME /opt/tomcat
ENV PATH $CATALINA_HOME/bin:$PATH
RUN mkdir -p "$CATALINA_HOME"
WORKDIR /tmp

RUN curl -SsO https://archive.apache.org/dist/tomcat/tomcat-8/v8.0.48/bin/apache-tomcat-8.0.48.tar.gz && \
	tar -xvf /tmp/apache-tomcat-8.0.48.tar.gz -C /opt/tomcat --strip-components=1 && \
    rm $CATALINA_HOME/bin/*.bat && rm /tmp/apache-tomcat-8.0.48.tar.gz

WORKDIR $CATALINA_HOME

COPY files/tomcat-keystore conf/
COPY files/server.xml conf/
COPY files/catalina.sh bin/

CMD ["catalina.sh", "run"]
