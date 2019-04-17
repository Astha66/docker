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

# Dockerfile to setup a container with the Shibboleth Discovery Service

FROM ojbc/java8-tomcat8

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR /tmp

RUN curl -SsL http://shibboleth.net/downloads/centralized-discovery-service/latest/shibboleth-discovery-service-1.2.1-bin.zip -o shibboleth-discovery-service-1.2.1-bin.zip && \
	unzip shibboleth-discovery-service-1.2.1-bin.zip && \
	cd shibboleth-discovery-service-1.2.1 && \
	sed -i "/.*input.*/d" src/installer/resources/build.xml && \
	./install.sh && \
	cp /opt/shibboleth-ds/war/discovery.war /opt/tomcat/webapps/

COPY files/rapback-ctf.xml /opt/shibboleth-ds/metadata/
COPY files/wayfconfig.xml /opt/shibboleth-ds/conf/
