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

RUN curl -sSL https://repo1.maven.org/maven2/org/ojbc/web/ojb-web-account-manager/1.0.0/ojb-web-account-manager-1.0.0.war -o /opt/tomcat/webapps/ojb-web-account-manager.war

#Copy catalina.properties files that points to ojb shared loader

COPY files/catalina.properties /opt/tomcat/conf
COPY files/banner.jpg /root/ojb-web-account-manager/web-resources/images/

CMD ["catalina.sh", "run"]
