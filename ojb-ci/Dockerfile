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

#The jenkins alpine image was causing issues with libraries reqiured by Java
#The frovlad alpine image handled those issues but Jenkins is not using that image
#FROM jenkins:1.651.2-alpine
FROM jenkins:1.651.2

USER root

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

#the libraries below are used by Alpine
#RUN apk add --update bash curl ca-certificates unzip

ENV JAVA_OPTS="-Xmx1024m"
ENV MVN_OPTS="-Xms1024m -Xmx3g -XX:PermSize=256m"
ENV JAVA_HOME /usr/java/jdk1.8.0_91

# get maven 3.2.5
RUN wget -O /tmp/apache-maven-3.2.5.tar.gz http://archive.apache.org/dist/maven/maven-3/3.2.5/binaries/apache-maven-3.2.5-bin.tar.gz

# install maven
RUN mkdir -p /opt
RUN mkdir -p $JAVA_HOME
RUN mkdir -p $JAVA_HOME/jre/lib/security
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

#ADD JDK to image and fix path in /usr/bin/java to point to oracle JDK rather than Open JDK
#This build assummes JDK in bin directory
#TODO: Add 
COPY bin/jdk-8u91-linux-x64.tar.gz /tmp/

RUN  mkdir -p /usr/java  && \
	 tar -zxf /tmp/jdk-8u91-linux-x64.tar.gz -C /usr/java && \
     rm -f /tmp/jdk-8u91-linux-x64.tar.gz && \
     rm -rf "$JAVA_HOME/"*src.zip && \
     rm -rf "$JAVA_HOME/lib/missioncontrol" \
           "$JAVA_HOME/lib/visualvm" \
           "$JAVA_HOME/lib/"*javafx* \
           "$JAVA_HOME/jre/lib/plugin.jar" \
           "$JAVA_HOME/jre/lib/ext/jfxrt.jar" \
           "$JAVA_HOME/jre/bin/javaws" \
           "$JAVA_HOME/jre/lib/javaws.jar" \
           "$JAVA_HOME/jre/lib/desktop" \
           "$JAVA_HOME/jre/plugin" \
           "$JAVA_HOME/jre/lib/"deploy* \
           "$JAVA_HOME/jre/lib/"*javafx* \
           "$JAVA_HOME/jre/lib/"*jfx* \
           "$JAVA_HOME/jre/lib/amd64/libdecora_sse.so" \
           "$JAVA_HOME/jre/lib/amd64/"libprism_*.so \
           "$JAVA_HOME/jre/lib/amd64/libfxplugins.so" \
           "$JAVA_HOME/jre/lib/amd64/libglass.so" \
           "$JAVA_HOME/jre/lib/amd64/libgstreamer-lite.so" \
           "$JAVA_HOME/jre/lib/amd64/"libjavafx*.so \
           "$JAVA_HOME/jre/lib/amd64/"libjfx*.so && \
    rm -rf "$JAVA_HOME/jre/bin/orbd" \
           "$JAVA_HOME/jre/bin/pack200" \
           "$JAVA_HOME/jre/bin/policytool" \
           "$JAVA_HOME/jre/bin/servertool" \
           "$JAVA_HOME/jre/bin/tnameserv" \
           "$JAVA_HOME/jre/bin/unpack200" \
           "$JAVA_HOME/jre/lib/jfr.jar" \
           "$JAVA_HOME/jre/lib/jfr" \
           "$JAVA_HOME/jre/lib/oblique-fonts" && \
    curl -O -L -H "Cookie: oraclelicense=accept-securebackup-cookie;" \
        "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" && \
    unzip jce_policy-8.zip && cp UnlimitedJCEPolicyJDK8/*.jar $JAVA_HOME/jre/lib/security && \
	rm /usr/bin/java && \
	ln -s $JAVA_HOME/bin/java /usr/bin/java

USER jenkins

COPY files/plugins.txt /usr/share/jenkins/ref/
RUN /usr/local/bin/plugins.sh /usr/share/jenkins/ref/plugins.txt
