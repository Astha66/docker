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

# Dockerfile for a Tomcat container with the ojbc-web-portal webapp installed

FROM ojbc/java8-tomcat8

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

#Copy catalina.properties files that points to ojb shared loader
COPY files/catalina.properties /opt/tomcat/conf

COPY /bin/ojbc_web_portal.war /opt/tomcat/webapps/ojb-web-portal.war
#COPY /usr/local/search/rapback/ojb-web-external-resource-rapback /root/ojb-web-external-resource
#COPY /usr/local/search/rapback/ojb-certs /root/ojb-certs
COPY files/rapback/ojb-web-external-resource /root/ojb-web-external-resource
COPY files/rapback/ojb-certs  /root/ojb-certs

#RUN cd && apk add --update subversion && svn export https://github.com/ojbc/main/trunk/web/ojb-web-external-resource &&  \
#    cd && svn export https://github.com/ojbc/main/trunk/shared/ojb-certs && apk del subversion  && \
#	sed -i 's/intermediary\.request\.hostName\=localhost/intermediary\.request\.hostName\=karaf\-demostate/g' /root/ojb-web-external-resource/config/ojbc-web-application-connector.cfg && \
#	sed -i 's/webapplication\.response\.hostName\=localhost/webapplication\.response\.hostName\=ojb\-web\-portal/g' /root/ojb-web-external-resource/config/ojbc-web-application-connector.cfg
		

CMD ["catalina.sh", "run"]
