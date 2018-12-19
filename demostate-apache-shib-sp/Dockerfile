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

FROM ojbc/apache-shib-sp
MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"


# copying shibboleth config files and certs
COPY files/shibboleth2.xml /etc/shibboleth/shibboleth2.xml
COPY files/shib.conf /usr/local/apache2/conf/extra/shib.conf
COPY files/attribute-map.xml /etc/shibboleth/attribute-map.xm
COPY files/demostate-ctf.xml /etc/shibboleth/demostate-ctf.xml


# copying apache config files and certs
COPY files/httpd.conf /usr/local/apache2/conf/httpd.conf 
COPY files/proxy.conf /usr/local/apache2/conf/extra/proxy.conf
COPY files/server.crt /usr/local/apache2/conf/server.crt
COPY files/server.key /usr/local/apache2/conf/server.key
