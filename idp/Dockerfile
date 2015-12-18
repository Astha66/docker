# Dockerfile to setup a container with the Shibboleth IDP 

FROM ojbc/java8-tomcat8

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR /tmp

RUN apk add --update unzip zip tar curl && \
	curl -O http://shibboleth.net/downloads/identity-provider/3.2.0/shibboleth-identity-provider-3.2.0.zip && \
	unzip shibboleth-identity-provider-3.2.0.zip && cd shibboleth-identity-provider-3.2.0 && \
	echo "idp.entityID=https://idp.ojbc.local/idp/shibboleth" > props && \
	bin/install.sh -Didp.target.dir=/opt/shibboleth-idp -Didp.host.name=idp.ojbc.local -Didp.sealer.password=password \
		-Didp.keystore.password=password -Didp.src.dir=/tmp/shibboleth-identity-provider-3.2.0 -Didp.scope=ojbc.local \
		-Didp.noprompt=true -Didp.merge.properties=props && \
	cd /opt/shibboleth-idp/war && mkdir tmp && \
	mv idp.war tmp/ && cd tmp && \
	unzip idp.war && \
	curl -O https://repo1.maven.org/maven2/jstl/jstl/1.2/jstl-1.2.jar && \
	mv jstl-1.2.jar WEB-INF/lib && \
	cd .. && jar -cvfM idp.war -C tmp/ . && \
	rm -rf tmp && rm -rf /tmp/*

COPY files/demostate-ctf.xml /opt/shibboleth-idp/metadata/demostate-ctf.xml

COPY files/access-control.xml /opt/shibboleth-idp/conf/access-control.xml
COPY files/attribute-filter.xml /opt/shibboleth-idp/conf/attribute-filter.xml
COPY files/attribute-resolver.xml /opt/shibboleth-idp/conf/attribute-resolver.xml
COPY files/relying-party.xml /opt/shibboleth-idp/conf/relying-party.xml
COPY files/metadata-providers.xml /opt/shibboleth-idp/conf/metadata-providers.xml
COPY files/ldap.properties /opt/shibboleth-idp/conf/ldap.properties

COPY files/idp-signing.* /opt/shibboleth-idp/credentials/

COPY files/catalina.properties /opt/tomcat/conf/

RUN mkdir -p /opt/tomcat/conf/Catalina/localhost
RUN echo '<Context docBase="/opt/shibboleth-idp/war/idp.war" privileged="true" antiResourceLocking="false" swallowOutput="true" />' > /opt/tomcat/conf/Catalina/localhost/idp.xml

WORKDIR /opt/shibboleth-idp

CMD ["catalina.sh", "run"]
