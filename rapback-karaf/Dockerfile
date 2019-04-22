# Dockerfile to build icots Karaf container

FROM ojbc/java8-server-base

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN apk add --update unzip zip tar curl

ENV KARAF_HOME /opt/karaf
ENV PATH $KARAF_HOME/bin:$PATH
RUN mkdir -p "$KARAF_HOME"
WORKDIR /tmp

RUN curl -O http://archive.apache.org/dist/karaf/4.0.10/apache-karaf-4.0.10.tar.gz && \
	tar -xvf /tmp/apache-karaf-4.0.10.tar.gz -C /opt/karaf --strip-components=1 && \
    rm /tmp/apache-karaf-4.0.10.tar.gz

WORKDIR $KARAF_HOME

COPY files/org.ops4j.pax.logging.cfg etc/
COPY files/Subscription_Notification_Service_Intermediary_Hawaii_EmailStrategyConfig.xml etc/
COPY files/audit_rest_utility.cfg etc/
COPY files/hijis_ftp_connector.cfg etc/
COPY files/jetty.xml etc/
COPY files/org.ops4j.pax.web.cfg etc/
COPY files/ojbc.context.services.cfg etc/
COPY files/karaf_305-wrapper.conf etc/

COPY files/karaf-feature-bundle-install-script.sh /tmp/karaf-feature-bundle-install-script.sh

#COPY files/karaf-feature-bundle-install-script-ojb.sh /tmp/karaf-feature-bundle-install-script-ojb.sh

#COPY files/karaf-feature-bundle-install-script-spring-jdbc.sh /tmp/karaf-feature-bundle-install-script-spring-jdbc.sh

#Copy the cfg files
COPY files/*.cfg etc/

#Copy the jar files
COPY files/*.jar /tmp/

RUN /opt/karaf/bin/start; \
	until /opt/karaf/bin/client version; do sleep 10s; done; \
	/opt/karaf/bin/client -f /tmp/karaf-feature-bundle-install-script.sh

#RUN sleep 20s;

#RUN /opt/karaf/bin/start; \
#	until /opt/karaf/bin/client version; do sleep 10s; done; \
#	/opt/karaf/bin/client -f /tmp/karaf-feature-bundle-install-script-spring-jdbc.sh

#RUN sleep 20s;

#RUN /opt/karaf/bin/start; \
#	until /opt/karaf/bin/client version; do sleep 10s; done; \
#	/opt/karaf/bin/client -f /tmp/karaf-feature-bundle-install-script-ojb.sh

#RUN sleep 10s;

RUN	/opt/karaf/bin/stop; exit 0
	
# see parent for run comments
CMD ["karaf", "server"]