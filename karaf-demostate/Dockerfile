
# Dockerfile to build a Karaf container, you should run this build with the no cache option: docker build --no-cache -t ojbc/karaf-demostate .

FROM ojbc/java8-karaf3

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

#Copy karaf install script to image
COPY files/karaf-feature-bundle-install-script.sh /tmp/karaf-feature-bundle-install-script.sh

#Copy karaf specific files
WORKDIR $KARAF_HOME

COPY files/org.apache.karaf.features.cfg etc/
COPY files/ojbc.context.services.cfg etc/
COPY files/org.ops4j.pax.url.mvn.cfg etc/
COPY files/org.ops4j.pax.web.cfg etc/
#
COPY files/org.apache.cxf.osgi.cfg etc/
#
#COPY files/features_demostate.xml tmp
COPY files/karaf-feature-bundle-install-script.sh tmp
COPY files/org.apache.karaf.features.repos.cfg etc/

# Need to deploy the Entity Resolution Resources until maven central is updated
COPY files/Entity_Resolution_Resources-1.0.2.jar deploy


WORKDIR $KARAF_HOME/etc

# Update config files with proper portal hostname localhost

RUN curl -sSL http://raw.githubusercontent.com/ojbc/main/master/shared/ojb-policy-decision-point-service/src/main/config/dev/ojb_policy_decision_point_service.cfg -o ojb_policy_decision_point_service.cfg  && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' ojb_policy_decision_point_service.cfg && \
	
	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/policy-acknowledgement-service-intermediary/src/main/config/dev/policy_acknowledgement_service_intermediary.cfg -o policy_acknowledgement_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' policy_acknowledgement_service_intermediary.cfg && \

# Search intermediaries
	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/subscription-notification-service-intermediary/src/main/resources/subscription_notification_service_intermediary.cfg -o subscription_notification_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' subscription_notification_service_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/firearm-search-request-service-intermediary/src/main/resources/firearms_search_request_service_intermediary.cfg -o firearms_search_request_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' firearms_search_request_service_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/incident-search-request-service-intermediary/src/main/resources/incident_search_request_service_intermediary.cfg -o incident_search_request_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' incident_search_request_service_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/vehicle-search-request-service-intermediary/src/main/resources/vehicle_search_request_service_intermediary.cfg -o vehicle_search_request_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' vehicle_search_request_service_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/person-search-request-service-intermediary/src/main/config/dev/person_search_request_service_intermediary.cfg -o person_search_request_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' person_search_request_service_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/organization-identification-results-search-service-intermediary/src/main/resources/organization_identification_results_search_service_intermediary.cfg  -o organization_identification_results_search_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' organization_identification_results_search_service_intermediary.cfg && \
	
		curl -sSL https://raw.githubusercontent.com/ojbc/main/master/intermediaries/court-case-search-service-intermediary/src/main/resources/court_case_search_service_intermediary.cfg -o court_case_search_service_intermediary.cfg  && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' court_case_search_service_intermediary.cfg && \

	curl -sSL https://raw.githubusercontent.com/ojbc/main/master/intermediaries/custody-search-request-service-intermediary/src/main/resources/custody_search_request_service_intermediary.cfg -o custody_search_request_service_intermediary.cfg  && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' custody_search_request_service_intermediary.cfg && \

# query intermediaries
	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/person-query-service-criminal-history-intermediary/src/main/resources/person_query_service_criminal_history_intermediary.cfg -o person_query_service_criminal_history_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' person_query_service_criminal_history_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/person-query-service-warrants-intermediary/src/main/resources/person_query_service_warrants_intermediary.cfg -o person_query_service_warrants_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' person_query_service_warrants_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/firearm-registration-query-request-service-intermediary/src/main/resources/firearm_registration_query_request_service_intermediary.cfg -o firearm_registration_query_request_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' firearm_registration_query_request_service_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/juvenile-history-service-intermediary/src/main/resources/juvenile_history_service_intermediary.cfg -o juvenile_history_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' juvenile_history_service_intermediary.cfg && \

	curl -sSL http://raw.githubusercontent.com/ojbc/main/master/intermediaries/organization-identification-results-query-service-intermediary/src/main/resources/organization_identification_results_query_service_intermediary.cfg -o organization_identification_results_query_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' organization_identification_results_query_service_intermediary.cfg && \

	curl -sSL https://raw.githubusercontent.com/ojbc/main/master/intermediaries/incident-report-request-service-intermediary/src/main/config/dev/incident_report_request_service_intermediary.cfg -o incident_report_request_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' incident_report_request_service_intermediary.cfg && \

	curl -sSL https://raw.githubusercontent.com/ojbc/main/master/intermediaries/court-case-query-service-intermediary/src/main/resources/court_case_query_service_intermediary.cfg -o court_case_query_service_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' court_case_query_service_intermediary.cfg && \
	
	curl -sSL https://raw.githubusercontent.com/ojbc/main/master/intermediaries/custody-query-service-intermediary/src/main/resources/custody_query_intermediary.cfg -o custody_query_intermediary.cfg  && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' custody_query_intermediary.cfg && \

	curl -sSL https://raw.githubusercontent.com/ojbc/main/master/intermediaries/person-query-service-vehicle-crash-intermediary/src/main/resources/person_query_service_vehicle_crash_intermediary.cfg -o  person_query_service_vehicle_crash_intermediary.cfg && \
	sed -i 's/localhost\:18311/ojb\-web\-portal\:18311/g' person_query_service_vehicle_crash_intermediary.cfg
		

# Run the karaf instance.  The first start / sleep / stop will make sure supporting container bundles are installed
# That is followed by a script that will install the karaf demostate bundles

RUN /opt/karaf/bin/start; \
	until /opt/karaf/bin/client -u karaf -h 127.0.0.1 version; do sleep 10s; done; \
	/opt/karaf/bin/client -u karaf -h 127.0.0.1 -f /tmp/karaf-feature-bundle-install-script.sh \
	/opt/karaf/bin/stop 
	
# see parent for run comments
CMD ["karaf", "server"]
