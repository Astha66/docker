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

# Dockerfile that extends base saiku to add demo data sources

FROM ojbc/saiku

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR /tmp

RUN mkdir -p /opt/saiku-config/

COPY files/saml-user-config.xml /opt/saiku-config/
COPY files/server-config.sh /tmp/
#COPY files/Incident-Arrest.connection.json /tmp/
COPY files/Jail-Booking.connection.json /tmp/
COPY files/JailBookingMondrianSchema.xml /tmp/

COPY files/mariadb-java-client-2.2.0.jar /opt/saiku-server/tomcat/webapps/saiku/WEB-INF/lib/

# note: if you want to change Saiku logging, grab log4j.xml and mondrian.properties
# from /opt/saiku-server/tomcat/webapps/saiku/WEB-INF/classes, put them in the files/ directory, edit
# them as desired, and then uncomment these lines

#COPY files/log4j.xml /opt/saiku-server/tomcat/webapps/saiku/WEB-INF/classes/
#COPY files/mondrian.properties /opt/saiku-server/tomcat/webapps/saiku/WEB-INF/classes/

RUN chmod a+x /tmp/server-config.sh
RUN /tmp/server-config.sh

RUN cd /opt/saiku-server/tomcat

CMD ["/opt/saiku-server/start-saiku.sh"]
