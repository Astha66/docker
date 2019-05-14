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
# Copyright 2012-2017 Open Justice Broker Consortium
#

FROM ojbc/java8-tomcat8

RUN mkdir -p /opt/tomcat/shared/config

RUN curl -s http://central.maven.org/maven2/org/ojbc/mondrian-rest/1.3.0/mondrian-rest-1.3.0.war -o /opt/tomcat/webapps/mondrian-rest.war
RUN curl -s http://central.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/2.2.3/mariadb-java-client-2.2.3.jar -o /opt/tomcat/shared/mariadb-java-client-2.2.3.jar

COPY files/catalina.properties /opt/tomcat/conf/

COPY files/*.json /opt/tomcat/shared/
COPY files/*.xml /opt/tomcat/shared/
COPY files/application.properties /opt/tomcat/shared/config/

# Prior to building this image, you need to build the dashboards webapp (.war file), which lives in the ojbc analytics github repo, at
#  analytics/booking-jail/dashboards.  Built it with 'mvn install' and then copy target/dashboards.war into the files/ subdir here.

COPY files/dashboards.war /opt/tomcat/webapps/
