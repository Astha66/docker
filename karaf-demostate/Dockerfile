
# Dockerfile to build a Karaf container

FROM ojbc/java8-karaf3

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR $KARAF_HOME

COPY files/org.apache.karaf.features.cfg etc/
COPY files/ojbc.context.services.cfg etc/
COPY files/org.ops4j.pax.url.mvn.cfg etc/
COPY files/ojb-features.xml etc/

WORKDIR $KARAF_HOME/deploy

# see parent for run comments
CMD ["karaf", "server"]
