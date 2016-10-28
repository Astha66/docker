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

# Dockerfile for OJB analytics platform server
# To run:  docker run -d --name=dashboards ojbc/analytics-opencpu-demo
# Then visit (assuming weave is running): http://dashboards.ojbc.local/ocpu/library/DemoJailBookingDashboard/www/index.html

FROM ojbc/analytics-opencpu

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

COPY bin/*.tar.gz /tmp/

WORKDIR /tmp

RUN apt-get install -y libcairo-dev

RUN R -e 'install.packages(c("/tmp/JailBookingDashboard_0.1.tar.gz","/tmp/DemoJailBookingDashboardData_0.1.tar.gz","/tmp/DemoJailBookingDashboard_0.1.tar.gz"), repos=NULL, type="source")'
