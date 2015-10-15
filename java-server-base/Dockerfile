FROM ubuntu:14.04

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update -y

# Install JDK from a local install file in the bin directory

COPY bin/jdk-7u80-linux-x64.gz /tmp/

RUN mkdir /opt/jdk
RUN tar -zxf /tmp/jdk-7u80-linux-x64.gz -C /opt/jdk
RUN rm -f /tmp/jdk-7u80-linux-x64.gz
RUN update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.7.0_80/bin/java 100
RUN update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.7.0_80/bin/javac 100
ENV JAVA_HOME /opt/jdk/jdk1.7.0_80

# Install supervisord

RUN apt-get -y install supervisor && \
  mkdir -p /var/log/supervisor && \
  mkdir -p /etc/supervisor/conf.d

# supervisor base configuration
COPY files/supervisord.conf /etc/supervisord.conf

# default command
CMD ["supervisord", "-c", "/etc/supervisord.conf"]
