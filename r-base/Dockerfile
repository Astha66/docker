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

# Dockerfile for basic R stuff.  We extend the main r-base image so we can add common stuff we typically need

FROM r-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

# we install some commonly-used packages (and their native library dependencies) because it takes a long time
# to install these the first time...

RUN apt-get update && apt-get install -y libssl-dev libcurl4-openssl-dev libssh2-1-dev libproj-dev libgdal-dev
RUN R -e 'install.packages(c("devtools", "Rcpp", "BH", "dplyr", "tidyr"), repos="http://cran.us.r-project.org")'
