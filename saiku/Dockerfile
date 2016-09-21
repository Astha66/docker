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

# Dockerfile to build a Saiku container running on Java 8

FROM ojbc/java8-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR /tmp
RUN wget http://meteorite.bi/downloads/saiku-latest.zip

COPY files/license_saiku.ojbc.local.lic /tmp/
COPY files/server-config.sh /tmp/

#Below we move the 'ROOT' application to sauki-ui to make it easier to proxy with Apache
RUN	unzip saiku-latest.zip && \
	mv saiku-server /opt && \
	rm -f saiku-latest.zip && \
	mv /opt/saiku-server/tomcat/webapps/ROOT /opt/saiku-server/tomcat/webapps/saiku-ui && \
	sed -i "s/sh startup.sh/\/opt\/saiku-server\/tomcat\/bin\/catalina.sh run/g" /opt/saiku-server/start-saiku.sh && \
	sed -i s/8080/80/g /opt/saiku-server/tomcat/conf/server.xml

COPY files/saiku-beans.properties /opt/saiku-server/tomcat/webapps/saiku/WEB-INF/

RUN chmod ugo+x /tmp/server-config.sh
RUN /tmp/server-config.sh

COPY files/saiku.min.js /opt/saiku-server/tomcat/webapps/saiku-ui/
COPY files/Settings-noauth.js /opt/saiku-server/tomcat/webapps/saiku-ui/js/saiku/Settings.js
COPY files/Settings-orig.js /tmp/
COPY files/Settings-noauth.js /tmp/

RUN cd /opt/saiku-server/tomcat

CMD ["/opt/saiku-server/start-saiku.sh"]

