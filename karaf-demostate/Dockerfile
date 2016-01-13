
# Dockerfile to build a Karaf container

FROM ojbc/java8-karaf3

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

COPY files/karf-feature-bundle-install-script.sh /tmp/karf-feature-bundle-install-script.sh

WORKDIR $KARAF_HOME

COPY files/org.apache.karaf.features.cfg etc/
COPY files/ojbc.context.services.cfg etc/
COPY files/org.ops4j.pax.url.mvn.cfg etc/
COPY files/ojb-features.xml etc/

WORKDIR $KARAF_HOME/etc

# Update config files with proper portal hostname ojb-web-portal.ojbc.local

RUN curl -sSL http://raw.githubusercontent.com/ojbc/main/master/shared/ojb-policy-decision-point-service/src/main/config/dev/ojb_policy_decision_point_service.cfg -o ojb_policy_decision_point_service.cfg  && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\.ojbc\.local\:18311/g' ojb_policy_decision_point_service.cfg && \
	
	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/policy-acknowledgement-service-intermediary/src/main/config/dev/policy_acknowledgement_service_intermediary.cfg -o policy_acknowledgement_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\.ojbc\.local\:18311/g' policy_acknowledgement_service_intermediary.cfg && \

# Search intermediaries
	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/subscription-notification-service-intermediary/src/main/resources/subscription_notification_service_intermediary.cfg -o subscription_notification_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\.ojbc\.local\:18311/g' subscription_notification_service_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/firearm-search-request-service-intermediary/src/main/resources/firearms_search_request_service_intermediary.cfg -o firearms_search_request_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\.ojbc\.local\:18311/g' firearms_search_request_service_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/incident-search-request-service-intermediary/src/main/resources/incident_search_request_service_intermediary.cfg -o incident_search_request_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\.ojbc\.local\:18311/g' incident_search_request_service_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/vehicle-search-request-service-intermediary/src/main/resources/vehicle_search_request_service_intermediary.cfg -o vehicle_search_request_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\.ojbc\.local\:18311/g' vehicle_search_request_service_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/person-search-request-service-intermediary/src/main/config/dev/person_search_request_service_intermediary.cfg -o person_search_request_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\.ojbc\.local\:18311/g' person_search_request_service_intermediary.cfg && \

# query intermediaries
	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/person-query-service-criminal-history-intermediary/src/main/resources/person_query_service_criminal_history_intermediary.cfg -o person_query_service_criminal_history_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\.ojbc\.local\:18311/g' person_query_service_criminal_history_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/person-query-service-warrants-intermediary/src/main/resources/person_query_service_warrants_intermediary.cfg -o person_query_service_warrants_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\.ojbc\.local\:18311/g' person_query_service_warrants_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/firearm-registration-query-request-service-intermediary/src/main/resources/firearm_registration_query_request_service_intermediary.cfg -o firearm_registration_query_request_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\.ojbc\.local\:18311/g' firearm_registration_query_request_service_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/juvenile-history-service-intermediary/src/main/resources/juvenile_history_service_intermediary.cfg -o juvenile_history_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\.ojbc\.local\:18311/g' juvenile_history_service_intermediary.cfg

RUN /opt/karaf/bin/start; \
	until /opt/karaf/bin/client -u karaf -h 127.0.0.1 version; do sleep 10s; done; \
	/opt/karaf/bin/client -u karaf -h 127.0.0.1 -f /tmp/karf-feature-bundle-install-script.sh \
	/opt/karaf/bin/stop 
	
# see parent for run comments
CMD ["karaf", "server"]
