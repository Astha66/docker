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

# Dockerfile for the OJBC sandbox service provider at https://demo.ojbc.org

FROM ojbc/portal

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR /tmp

# change apache server name and retrieve the demostate trust fabric
RUN sed -i "s/ServerName localhost:80/ServerName demo.ojbc.org:80/g" /etc/apache2/httpd.conf && \
	curl -O https://raw.githubusercontent.com/ojbc/main/master/shared/ojb-saml-metadata/demostate-ctf.xml && \
	cp -f demostate-ctf.xml /opt/shibboleth-sp/etc/shibboleth/
	
# Copy config files over
	
COPY files/shibboleth2.xml /opt/shibboleth-sp/etc/shibboleth/
COPY files/server.key /opt/shibboleth-sp/etc/shibboleth/sp-key.pem
COPY files/server.pem /opt/shibboleth-sp/etc/shibboleth/sp-cert.pem
COPY files/server.pem /etc/ssl/apache2/
COPY files/server.key /etc/ssl/apache2/
