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

# Dockerfile to setup a container with the Shibboleth IDP

FROM ojbc/java8-tomcat8

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR /tmp

COPY files/ojbc-logo.png /tmp/

RUN apk add --update unzip zip tar curl && \
	curl -O http://shibboleth.net/downloads/identity-provider/3.4.6/shibboleth-identity-provider-3.4.6.zip && \
	unzip shibboleth-identity-provider-3.4.6.zip && cd shibboleth-identity-provider-3.4.6 && \
	echo "idp.entityID=https://idp.ojbc.local/idp/shibboleth" > props && \
	bin/install.sh -Didp.target.dir=/opt/shibboleth-idp -Didp.host.name=localhost -Didp.sealer.password=password \
		-Didp.keystore.password=password -Didp.src.dir=/tmp/shibboleth-identity-provider-3.4.6 -Didp.scope=localdomain \
		-Didp.noprompt=true -Didp.merge.properties=props && \
	cd /opt/shibboleth-idp/war && mkdir tmp && \
	mv idp.war tmp/ && cd tmp && \
	unzip idp.war && \
	mv /tmp/ojbc-logo.png images && \
	curl -O https://repo1.maven.org/maven2/jstl/jstl/1.2/jstl-1.2.jar && \
	mv jstl-1.2.jar WEB-INF/lib && \
	cd .. && jar -cvfM idp.war -C tmp/ . && \
	rm -rf tmp && rm -rf /tmp/*


RUN cp -r /opt/shibboleth-idp/conf /tmp/

COPY files/demostate-ctf.xml /opt/shibboleth-idp/metadata/demostate-ctf.xml

COPY files/access-control.xml /opt/shibboleth-idp/conf/access-control.xml
COPY files/attribute-filter.xml /opt/shibboleth-idp/conf/attribute-filter.xml
COPY files/attribute-resolver.xml /opt/shibboleth-idp/conf/attribute-resolver.xml
COPY files/relying-party.xml /opt/shibboleth-idp/conf/relying-party.xml
COPY files/metadata-providers.xml /opt/shibboleth-idp/conf/metadata-providers.xml
COPY files/ldap.properties /opt/shibboleth-idp/conf/ldap.properties

COPY files/idp-signing.* /opt/shibboleth-idp/credentials/

COPY files/login.vm /opt/shibboleth-idp/views/

COPY files/catalina.properties /opt/tomcat/conf/

RUN mkdir -p /opt/tomcat/conf/Catalina/localhost
RUN echo '<Context docBase="/opt/shibboleth-idp/war/idp.war" privileged="true" antiResourceLocking="false" swallowOutput="true" />' > /opt/tomcat/conf/Catalina/localhost/idp.xml

WORKDIR /opt/shibboleth-idp

CMD ["catalina.sh", "run"]
