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
	echo "ProxyPass /ojb-web-util ajp://ojb-web-util:8009/ojb-web-util" >> /etc/apache2/conf.d/proxy.conf && \

	printf "\n<Location /ojb-web-portal>\n\tAuthType shibboleth\n\tShibRequestSetting requireSession 1\n\tShibUseHeaders On\n\trequire shib-session\n</Location>\n" >> /etc/apache2/conf.d/shib.conf && \
	echo "ProxyPass /ojb-web-portal ajp://ojb-web-portal:8009/ojb-web-portal" >> /etc/apache2/conf.d/proxy.conf && \
	echo "ProxyPassReverse /ojb-web-portal ajp://ojb-web-portal:8009/idp" >> /etc/apache2/conf.d/proxy.conf && \

	printf "\n<Location /saiku>\n\tAuthType shibboleth\n\tShibRequestSetting requireSession 1\n\tShibUseHeaders On\n\trequire shib-session\n</Location>\n" >> /etc/apache2/conf.d/shib.conf && \
	printf "\n<Location /saiku-ui>\n\tAuthType shibboleth\n\tShibRequestSetting requireSession 1\n\tShibUseHeaders On\n\trequire shib-session\n</Location>\n" >> /etc/apache2/conf.d/shib.conf && \
	echo "ProxyPass /saiku ajp://saiku:8009/saiku" >> /etc/apache2/conf.d/proxy.conf && \
	echo "ProxyPassReverse /saiku ajp://saiku:8009/saiku" >> /etc/apache2/conf.d/proxy.conf && \
	echo "ProxyPass /saiku-ui ajp://saiku:8009/saiku-ui" >> /etc/apache2/conf.d/proxy.conf && \
	echo "ProxyPassReverse /saiku-ui ajp://saiku:8009/saiku-ui" >> /etc/apache2/conf.d/proxy.conf && \

	echo "ProxyPass /discovery ajp://samlds:8009/discovery" >> /etc/apache2/conf.d/proxy.conf && \
	echo "ProxyPassReverse /discovery ajp://samlds:8009/discovery" >> /etc/apache2/conf.d/proxy.conf && \

	echo "ProxyPass /idp ajp://idp:8009/idp" >> /etc/apache2/conf.d/proxy.conf && \
	echo "ProxyPassReverse /idp ajp://idp:8009/idp" >> /etc/apache2/conf.d/proxy.conf && \
	
	echo "ProxyPass /dashboards ajp://dashboards:8009/dashboards" >> /etc/apache2/conf.d/proxy.conf && \
	echo "ProxyPassReverse /dashboards ajp://dashboards:8009/dashboards" >> /etc/apache2/conf.d/proxy.conf && \
	
	echo "ProxyPass /mondrian-rest ajp://dashboards:8009/mondrian-rest" >> /etc/apache2/conf.d/proxy.conf && \
	echo "ProxyPassReverse /mondrian-rest ajp://dashboards:8009/mondrian-rest" >> /etc/apache2/conf.d/proxy.conf

COPY files/* /opt/shibboleth-sp/etc/shibboleth/

WORKDIR /opt/shibboleth-sp

CMD ["/opt/shibboleth-sp/sbin/start-shib-and-apache"]
