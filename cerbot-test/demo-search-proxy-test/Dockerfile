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

# This is intended to be for the demo.search.org server where we run the CCH analytics demo.

FROM ojbc/apache-shib-sp

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR /tmp

EXPOSE 443	
	
COPY files/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY files/proxy.conf /usr/local/apache2/conf/extra/proxy.conf
COPY files/ssl.conf /usr/local/apache2/conf/extra/
COPY files/shib.conf /usr/local/apache2/conf/extra/shib.conf
COPY files/CTF.xml /etc/shibboleth/CTF.xml
COPY files/shibboleth2.xml /etc/shibboleth/shibboleth2.xml
COPY files/demo.search.org.crt /opt/ojbc/certs/demo.search.org.crt
COPY files/demo.search.org.key /opt/ojbc/certs/demo.search.org.key

RUN mkdir -p /usr/local/apache2/htdocs/.well-known/acme-challenge
COPY files/index.html /usr/local/apache2/htdocs/.well-known/acme-challenge
COPY files/index.html /usr/local/apache2/htdocs/