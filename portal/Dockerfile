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

# Dockerfile for an image the portal Service Provider

FROM ojbc/apache-shib-sp-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN sed -i s/SSLMutex/#SSLMutex/g /etc/apache2/conf.d/ssl.conf && \
	sed -i "s/#ServerName.*/ServerName localhost:80/g" /etc/apache2/httpd.conf && \
	sed -i "s/UseCanonicalName Off/UseCanonicalName On/g" /etc/apache2/httpd.conf && \
	ln -s /opt/shibboleth-sp/etc/shibboleth/shib.conf /etc/apache2/conf.d/shib.conf && \
	printf "\n<Location /ojb-web-util>\n\tAuthType shibboleth\n\tShibRequestSetting requireSession 1\n\tShibUseHeaders On\n\trequire shib-session\n</Location>\n" >> /etc/apache2/conf.d/shib.conf && \
	printf "\n<Location /ojb-web-portal>\n\tAuthType shibboleth\n\tShibRequestSetting requireSession 1\n\tShibUseHeaders On\n\trequire shib-session\n</Location>\n" >> /etc/apache2/conf.d/shib.conf && \
	printf "\n<Location /saiku>\n\tAuthType shibboleth\n\tShibRequestSetting requireSession 1\n\tShibUseHeaders On\n\trequire shib-session\n</Location>\n" >> /etc/apache2/conf.d/shib.conf && \
	printf "\n<Location /saiku-ui>\n\tAuthType shibboleth\n\tShibRequestSetting requireSession 1\n\tShibUseHeaders On\n\trequire shib-session\n</Location>\n" >> /etc/apache2/conf.d/shib.conf
	
COPY files/shibboleth2.xml /opt/shibboleth-sp/etc/shibboleth/
COPY files/demostate-ctf.xml /opt/shibboleth-sp/etc/shibboleth/
COPY files/proxy.conf /etc/apache2/conf.d/proxy.conf
COPY files/health-check.html /var/www/localhost/htdocs/health-check.html

WORKDIR /opt/shibboleth-sp

CMD ["/opt/shibboleth-sp/sbin/start-shib-and-apache"]
