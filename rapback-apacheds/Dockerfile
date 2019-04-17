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

# Dockerfile to host the Apache DS directory server

FROM ojbc/java8-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR /tmp

RUN apk add --update zip unzip openldap-clients curl && \
	mkdir -p /opt && \
	cd /opt && \
# Changed zip location -jd 4/10/19
#	curl -sO https://www.apache.org/dist/directory/apacheds/dist/2.0.0-M23/apacheds-2.0.0-M23.zip && \
	curl -sO https://archive.apache.org/dist/directory/apacheds/dist/2.0.0-M23/apacheds-2.0.0-M23.zip && \
	unzip apacheds-2.0.0-M23.zip && \
	apk del zip unzip && \
	rm apacheds-2.0.0-M23.zip
	
WORKDIR /opt/apacheds-2.0.0-M23

COPY files/config.ldif /opt/apacheds-2.0.0-M23/instances/default/conf/
COPY files/setup.ldif /tmp/
COPY files/rapback-schema.ldif /tmp/

RUN chmod ugo+x bin/apacheds.sh

RUN bin/apacheds.sh start && sleep 10 && ldapmodify -h 127.0.0.1 -p 389 -x -a -v < /tmp/rapback-schema.ldif && \
	bin/apacheds.sh stop && sleep 10 && \
	bin/apacheds.sh start && sleep 10 && ldapmodify -h 127.0.0.1 -p 389 -x -a -v < /tmp/setup.ldif && \
	bin/apacheds.sh stop && sleep 10 && \
	rm /tmp/setup.ldif
	
CMD ["bin/apacheds.sh", "default", "run"]