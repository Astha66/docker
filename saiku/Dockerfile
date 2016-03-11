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

# Dockerfile to build a Saiku container running on Java 8

FROM ojbc/java8-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR /tmp
RUN wget http://meteorite.bi/downloads/saiku-latest.zip

RUN	unzip saiku-latest.zip && \
	mv saiku-server /opt && \
	rm -f saiku-latest.zip && \
	sed -i "s/sh startup.sh/\/opt\/saiku-server\/tomcat\/bin\/catalina.sh run/g" /opt/saiku-server/start-saiku.sh

CMD ["/opt/saiku-server/start-saiku.sh"]