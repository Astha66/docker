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


#install Shibboleth module and other required utilities
RUN apt update
RUN apt install -y apache2 vim curl libapache2-mod-shib2

#static page and label required for health checks
COPY files/health-check.html /usr/local/apache2/htdocs/health-check.html
LABEL health-checker-monitor="true"

# copying apache config files and certs
COPY files/httpd.conf /usr/local/apache2/conf/httpd.conf 
COPY files/server.crt /usr/local/apache2/conf/server.crt
COPY files/server.key /usr/local/apache2/conf/server.key

#certs for shib
COPY files/sp-cert.pem /etc/shibboleth/sp-cert.pem 
COPY files/sp-key.pem /etc/shibboleth/sp-key.pem 

COPY files/attribute-map.xml /etc/shibboleth/attribute-map.xml
COPY files/shibboleth2.xml /etc/shibboleth/shibboleth2.xml

# entrypoint script
COPY files/apache-shib-sp /usr/local/bin/apache-shib-sp
RUN chmod +x /usr/local/bin/apache-shib-sp

#Older versions of Eclipse Dockerfile editor don't recognize "HEALTHCHECK" but this is a legit argument
HEALTHCHECK --interval=10s --timeout=3s --retries=1 \
      CMD curl -f -k https://localhost/health-check.html

CMD ["apache-shib-sp"]    
