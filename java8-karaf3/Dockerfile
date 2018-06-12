


# Dockerfile to build a Karaf container

FROM ojbc/java8-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN apk add --update unzip zip tar curl

COPY files/git-download.sh /tmp/git-download.sh
RUN cd && mkdir ojb-certs && cd ojb-certs && /tmp/git-download.sh https://api.github.com/repos/ojbc/main/contents/shared/ojb-certs

ENV KARAF_HOME /opt/karaf
ENV PATH $KARAF_HOME/bin:$PATH
RUN mkdir -p "$KARAF_HOME"
WORKDIR /tmp

RUN curl -O http://archive.apache.org/dist/karaf/3.0.5/apache-karaf-3.0.5.tar.gz && \
	tar -xvf /tmp/apache-karaf-3.0.5.tar.gz -C /opt/karaf --strip-components=1 && \
    rm /tmp/apache-karaf-3.0.5.tar.gz

WORKDIR $KARAF_HOME

COPY files/setenv bin/
COPY files/org.apache.cxf.osgi.cfg etc/

# 
CMD ["karaf", "server"]

# can connect via:  ./bin/client -a 8101 -h 10.32.0.3 -u karaf -v
# 
