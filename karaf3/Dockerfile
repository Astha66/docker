# Dockerfile to build a Karaf container

FROM ojbc/java7-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN apk add --update unzip zip tar

ENV KARAF_HOME /opt/karaf
ENV PATH $KARAF_HOME/bin:$PATH
RUN mkdir -p "$KARAF_HOME"
WORKDIR $KARAF_HOME

COPY bin/apache-karaf-3.0.5.tar.gz /tmp/
RUN tar -xvf /tmp/apache-karaf-3.0.5.tar.gz -C /opt/karaf --strip-components=1 && \
    rm bin/*.bat && rm /tmp/apache-karaf-3.0.5.tar.gz

COPY files/setenv bin/

COPY files/org.ops4j.pax.web.cfg etc/
COPY files/org.ops4j.pax.url.mvn.cfg etc/
COPY files/ojbc.context.services.cfg etc/

CMD ["karaf.sh"]
