


# Dockerfile to build a Karaf container

FROM ojbc/java8-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN apk add --update unzip zip tar curl

ENV KARAF_HOME /opt/karaf
ENV PATH $KARAF_HOME/bin:$PATH
RUN mkdir -p "$KARAF_HOME"
WORKDIR /tmp

RUN curl -O https://www.apache.org/dist/karaf/3.0.5/apache-karaf-3.0.5.tar.gz && \
	tar -xvf /tmp/apache-karaf-3.0.5.tar.gz -C /opt/karaf --strip-components=1 && \
    rm /tmp/apache-karaf-3.0.5.tar.gz

WORKDIR $KARAF_HOME

COPY files/setenv bin/
COPY files/org.ops4j.pax.web.cfg etc/
COPY files/org.ops4j.pax.url.mvn.cfg etc/
COPY files/ojbc.context.services.cfg etc/

# can be run "weave friendly"(sets name) via:  docker run --name=karaf -d ojbc/java8-karaf3
CMD ["karaf", "server"]

# can connect via:  ./bin/client -a 8101 -h 10.32.0.3 -u karaf -v
# NOTE:  above, replace 10.32.0.3 with the weave address of the karaf image exposed by weave
