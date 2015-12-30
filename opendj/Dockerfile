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

# Dockerfile for an image with the OpenDJ directory server installed
# Note that you need to download a copy of the OpenDJ server to the bin directory before building

FROM ojbc/java7-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

COPY bin/opendj-server-2.6.0.zip /opt/

RUN apk add --update unzip
RUN cd /opt && unzip opendj-server-2.6.0.zip

ENV ROOT_USER_DN cn=Directory\ Manager
ENV ROOT_USER_PASS password
ENV BASE_DN dc=ojbc-local,dc=org

WORKDIR /opt/opendj
RUN ./setup --cli -v \
  --ldapPort 389 \
  --adminConnectorPort 4444 \
  --rootUserDN "$ROOT_USER_DN" \
  --rootUserPassword $ROOT_USER_PASS \
  --no-prompt --noPropertiesFile \
  --doNotStart

COPY files/setup.ldif /tmp/
  
RUN /opt/opendj/bin/start-ds && \
    /opt/opendj/bin/dsconfig create-backend --backend-name userRoot --type=local-db --set base-dn:dc=ojbc-local,dc=org --set enabled:true --noPropertiesFile --no-prompt -p 4444 --trustAll -w password -h localhost && \
    /opt/opendj/bin/import-ldif -b dc=ojbc-local,dc=org -n userRoot -l /tmp/setup.ldif -t 0 -p 4444 --trustAll -w password -h localhost && \
    /opt/opendj/bin/stop-ds

# to test this container:
# docker build -t opendj .
# docker run -P opendj
# substitute the appropriate IP address and port for your setup...
# ldapwhoami -x -h 192.168.99.101 -p 32769 -D "cn=demoadmin,ou=People,dc=ojbc-local,dc=org" -w password -v
    
CMD ["/opt/opendj/bin/start-ds", "--nodetach"]

