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

FROM httpd:2.4.37
MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

#install Apache
RUN apt update
RUN apt install -y apache2

# copying apache demo html files

COPY files/index-search.html /usr/local/apache2/htdocs/index.html
#COPY files/index-1.html /usr/www/example1/httpd/htdocs/index.html
#COPY files/index-1.html /usr/www/example1/httpd/htdocs/index.html

# copying apache config files
COPY files/httpd.conf /usr/local/apache2/conf/httpd.conf
COPY files/proxy.conf /usr/local/apache2/conf/proxy.conf
COPY files/ssl.conf /usr/local/apache2/conf/extra/ssl.conf

# copying apache certs
COPY files/Server.crt /usr/local/apache2/conf/Server.crt
COPY files/Server.key /usr/local/apache2/conf/Server.key

#COPY files/S1server.crt /usr/local/apache2/conf/S1server.crt
#COPY files/S1server.key /usr/local/apache2/conf/S1server.key
