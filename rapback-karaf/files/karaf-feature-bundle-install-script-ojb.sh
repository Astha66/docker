bundle:install -s mvn:org.ojbc.bundles.utilities/h2-mock-database
bundle:install -s mvn:org.ojbc.bundles.shared/ojb-resources-common
bundle:install -s mvn:org.ojbc.bundles.shared/ojb-osgi-common

bundle:install -s file:///tmp/ojb-common-3.0.2.jar

bundle:install -s mvn:org.ojbc.bundles.shared/ojb-camel-common
bundle:install -s mvn:org.ojbc.bundles.shared/ojb-fedquery-common

# Entity_Resolution_Resources is being copied to deploy
#bundle:install mvn:org.ojbc.bundles.shared/Entity_Resolution_Resources

bundle:install -s mvn:org.ojbc.bundles.intermediaries/Entity_Resolution_Service_Intermediary_OSGi
bundle:install -s mvn:org.ojbc.bundles.intermediaries/Entity_Resolution_Service_Intermediary


bundle:install -s file:///tmp/ojb-enhanced-audit-common-1.0.3.jar
bundle:install -s file:///tmp/person-search-request-service-intermediary-1.2.1.jar
bundle:install -s file:///tmp/subscription-notification-service-intermediary-common-2.0.11.jar
bundle:install -s file:///tmp/audit-rest-utility-1.0.4.jar
bundle:install -s file:///tmp/subscription-notification-service-intermediary-1.0.8.jar
bundle:install -s file:///tmp/person-query-service-criminal-history-intermediary-1.0.6.jar
bundle:install -s file:///tmp/policy-acknowledgement-service-intermediary-1.0.2.jar
bundle:install -s file:///tmp/ojb-policy-decision-point-service-1.0.2.jar
bundle:install -s file:///tmp/arrest-reporting-service-intermediary-1.0.6.jar
bundle:install -s file:///tmp/identification-reporting-service-intermediary-1.0.2.jar
bundle:install -s file:///tmp/organization-identification-results-search-service-intermediary-1.0.2.jar
bundle:install -s file:///tmp/organization-identification-results-query-service-intermediary-1.0.2.jar
bundle:install -s file:///tmp/identification-results-modification-service-intermediary-1.0.1.jar
bundle:install -s file:///tmp/criminal-identification-reporting-service-intermediary-1.0.0.jar
#bundle:install -s file:///tmp/parole-event-handler-service-intermediary-1.0.1.jar
bundle:install -s file:///tmp/disposition-reporting-service-intermediary-1.0.3.jar
bundle:install -s file:///tmp/firearm-search-request-service-intermediary-1.0.1.jar
bundle:install -s file:///tmp/firearm-registration-query-request-service-intermediary-1.0.2.jar
bundle:install -s file:///tmp/person-query-service-warrants-intermediary-1.0.2.jar
#bundle:install -s file:///tmp/probation-event-handler-service-intermediary-1.0.3.jar

bundle:install -s file:///tmp/arrest-reporting-service-intermediary-hawaii-1.0.0.jar
bundle:install -s file:///tmp/firearm-registration-query-request-service-intermediary-hawaii-1.0.1.jar
bundle:install -s file:///tmp/firearm-search-request-service-intermediary-hawaii-1.0.0.jar
bundle:install -s file:///tmp/parole-event-handler-service-intermediary-hawaii-1.0.0.jar
bundle:install -s file:///tmp/person-query-service-criminal-history-intermediary-hawaii-1.0.1.jar
bundle:install -s file:///tmp/person-query-service-warrants-intermediary-hawaii-1.0.1.jar
bundle:install -s file:///tmp/person-search-request-service-intermediary-hawaii-1.0.1.jar
bundle:install -s file:///tmp/policy-acknowledgement-service-intermediary-hawaii-1.0.0.jar
bundle:install -s file:///tmp/probation-event-handler-service-intermediary-hawaii-1.0.0.jar
bundle:install -s file:///tmp/subscription-notification-service-intermediary-hawaii-1.0.2.jar
bundle:install -s file:///tmp/ojb-policy-decision-point-service-hawaii-1.0.0.jar
bundle:install -s file:///tmp/hawaii-resources-1.0.0.jar
bundle:install -s file:///tmp/disposition-reporting-service-intermediary-hawaii-1.0.0.jar