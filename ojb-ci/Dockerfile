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

#To build, run this command:
#docker build --no-cache  -t ojbc/ojb-ci .

#To run, start up weave container and run this command:
#weave run -d --name=ojb-ci -v /pathToJenkinsHomeOnHost:/var/jenkins_home ojbc/ojb-ci

FROM jenkins:1.651.2-alpine

USER root

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN apk add --update bash curl ca-certificates unzip

ENV JAVA_OPTS="-Xmx1024m"
ENV MVN_OPTS="-Xms1024m -Xmx3g -XX:PermSize=256m"

# get maven 3.2.5
RUN wget -O /tmp/apache-maven-3.2.5.tar.gz http://archive.apache.org/dist/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz

# install maven
RUN mkdir -p /opt
RUN tar xzf /tmp/apache-maven-3.2.5.tar.gz -C /opt/
RUN ln -s /opt/apache-maven-3.2.5 /opt/maven
RUN ln -s /opt/maven/bin/mvn /usr/local/bin
RUN rm -f /tmp/apache-maven-3.2.5.tar.gz
ENV MAVEN_HOME /opt/maven

#Set up and force HTTPS, TODO: replace with certificate from volume
COPY files/ojb-ci.ojbc.local.cer /var/lib/jenkins/cert
COPY files/ojb-ci.ojbc.local.key /var/lib/jenkins/pk
ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8083 --httpsCertificate=/var/lib/jenkins/cert --httpsPrivateKey=/var/lib/jenkins/pk
EXPOSE 8083

RUN mkdir -p /var/jenkins_home/scripts
COPY files/cleanBuildContext.sh /var/jenkins_scripts/cleanBuildContext.sh
RUN chmod a+x /var/jenkins_scripts/cleanBuildContext.sh

USER jenkins

COPY files/plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
