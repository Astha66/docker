FROM ojbc/java8-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR /tmp

RUN apk add --update zip unzip openldap-clients wget && \
	mkdir -p /opt && \
	cd /opt && \
	wget --no-check-certificate https://www.apache.org/dist/directory/apacheds/dist/2.0.0-M20/apacheds-2.0.0-M20.zip && \
	unzip apacheds-2.0.0-M20.zip && \
	apk del zip unzip && \
	rm apacheds-2.0.0-M20.zip
	
WORKDIR /opt/apacheds-2.0.0-M20

COPY files/config.ldif /opt/apacheds-2.0.0-M20/instances/default/conf/
COPY files/setup.ldif /tmp/

RUN chmod ugo+x bin/apacheds.sh

RUN bin/apacheds.sh start && sleep 10 && ldapmodify -h 127.0.0.1 -p 389 -x -a -v < /tmp/setup.ldif && \
	bin/apacheds.sh stop && sleep 10 && \
	rm /tmp/setup.ldif
	
CMD ["bin/apacheds.sh", "default", "run"]