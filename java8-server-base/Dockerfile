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

# A Dockerfile to build an image with JDK 8

FROM frolvlad/alpine-glibc

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN apk add --update bash curl ca-certificates unzip

# Install JDK from a local install file in the bin directory

ENV JAVA_HOME /opt/jdk/jdk1.8.0_66
ENV PATH $PATH:$JAVA_HOME/bin

# You can run this Dockerfile in one of two ways.  Once you've accepted the Oracle license agreement,
# you can run it as-is, using wget inside the RUN directive below.  This will result in a smaller image because
# the temporary JDK install file is removed after the image build.  However, note that this requires you to be online
# when you do the build.  Alternatively, you can download the JDK yourself, put it in the bin directory, and uncomment
# the COPY directive below (but then remove the wget directive inside RUN.)

#COPY bin/jdk-8u66-linux-x64.tar.gz /tmp/

RUN  mkdir -p /opt/jdk && \

     cd /tmp && curl -O -L -H "Cookie: oraclelicense=accept-securebackup-cookie;" \
        "http://download.oracle.com/otn-pub/java/jdk/8u66-b17/jdk-8u66-linux-x64.tar.gz" && \

     tar -zxf /tmp/jdk-8u66-linux-x64.tar.gz -C /opt/jdk && \
     rm -f /tmp/jdk-8u66-linux-x64.tar.gz && \
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
    rm /var/cache/apk/* && \
    curl -O -L -H "Cookie: oraclelicense=accept-securebackup-cookie;" \
        "http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip" && \
    unzip jce_policy-8.zip && cp UnlimitedJCEPolicyJDK8/*.jar $JAVA_HOME/jre/lib/security && \
    apk del unzip curl ca-certificates

# default command
CMD ["java", "-version"]
