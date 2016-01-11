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

# Dockerfile for a Tomcat container with the ojbc-web-util webapp installed
# Note that you need to build the ojb-web-util war file first, and copy into the bin directory before building

FROM ojbc/java8-tomcat8

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN curl -sSL https://repo1.maven.org/maven2/org/ojbc/web/ojb-web-portal/2.0.0/ojb-web-portal-2.0.0.war -o /opt/tomcat/webapps/ojb-web-portal.war
#RUN curl -sSL https://repo1.maven.org/maven2/org/ojbc/web/ojb-web-util/1.0.0/ojb-web-util-1.0.0.war -o /opt/tomcat/webapps/ojb-web-util.war

#Copy catalina.properties files that points to ojb shared loader

COPY files/catalina.properties /opt/tomcat/conf

#Get certs

COPY files/git-download.sh /tmp/git-download.sh
RUN cd && mkdir ojb-certs && cd ojb-certs && /tmp/git-download.sh https://api.github.com/repos/ojbc/main/contents/shared/ojb-certs

#Get external web resource
RUN cd && mkdir ojb-web-external-resource && cd ojb-web-external-resource && \ 
	/tmp/git-download.sh https://api.github.com/repos/ojbc/main/contents/web/ojb-web-external-resource && \
	rm /tmp/git-download.sh && \
	sed -i 's/intermediary\.request\.hostName\=localhost/intermediary\.request\.hostName\=karaf\-demostate\.ojbc\.local/g' /root/ojb-web-external-resource/config/ojbc-web-application-connector.cfg
	

CMD ["catalina.sh", "run"]
