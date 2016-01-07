#    Unless explicitly acquired and licensed from Licensor under another license, the contents of
#    this file are subject to the Reciprocal Public License ("RPL") Version 1.5, or subsequent
#    versions as allowed by the RPL, and You may not copy or use this file in either source code
#    or executable form, except in compliance with the terms and conditions of the RPL
#
#    All software distributed under the RPL is provided strictly on an "AS IS" basis, WITHOUT
#    WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, AND LICENSOR HEREBY DISCLAIMS ALL SUCH
#    WARRANTIES, INCLUDING WITHOUT LIMITATION, ANY WARRANTIES OF MERCHANTABILITY, FITNESS FOR A
#    PARTICULAR PURPOSE, QUIET ENJOYMENT, OR NON-INFRINGEMENT. See the RPL for specific language
#    governing rights and limitations under the RPL.
#
#    http://opensource.org/licenses/RPL-1.5
#
#    Copyright 2012-2016 Open Justice Broker Consortium

# Dockerfile for Pentaho BI server

FROM ojbc/java7-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

# Note: sourceforge mirrors may change over time...may need to modify the download below

RUN mkdir /opt/pentaho && \
	cd /opt/pentaho && \
	curl -L http://sourceforge.net/projects/pentaho/files/Business%20Intelligence%20Server/5.4/biserver-ce-5.4.0.1-130.zip/download?use_mirror=tcpdiag -o biserver-ce-5.4.0.1-130.zip && \
	unzip biserver-ce-5.4.0.1-130.zip && \
	rm biserver-ce-5.4.0.1-130.zip && \
	cd /opt/pentaho/biserver-ce && \
	rm promptuser.sh && \
	sed -i "s/sh startup.sh/.\/catalina.sh run/g" start-pentaho.sh && \
	sed -i "s/8080/80/g" tomcat/conf/server.xml

WORKDIR /opt/pentaho/biserver-ce
	
CMD ["./start-pentaho.sh"]