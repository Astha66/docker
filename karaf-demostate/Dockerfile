
# Dockerfile to build a Karaf container

FROM ojbc/java8-karaf3

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR $KARAF_HOME

COPY files/org.apache.karaf.features.cfg etc/
COPY files/ojbc.context.services.cfg etc/
COPY files/org.ops4j.pax.url.mvn.cfg etc/
COPY files/ojb-features.xml etc/

WORKDIR $KARAF_HOME/etc

RUN curl -sSL http://raw.githubusercontent.com/ojbc/main/master/shared/ojb-policy-decision-point-service/src/main/config/dev/ojb_policy_decision_point_service.cfg -o ojb_policy_decision_point_service.cfg  && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\.ojbc\.local\:18311/g' ojb_policy_decision_point_service.cfg

# see parent for run comments
CMD ["karaf", "server"]
