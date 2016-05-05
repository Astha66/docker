#This script can be run from a karaf client as follows.  The dockerFile runs this as part of the build:
#/opt/karaf/bin/client -u karaf -h 127.0.0.1 -f /tmp/karaf-feature-bundle-install-script.sh

feature:install cxf/3.0.6
feature:install camel/2.14.4
feature:install camel-saxon/2.14.4
feature:install camel-cxf/2.14.4
feature:install cxf-ws-security/3.0.6
feature:install camel-http4/2.14.4
feature:install camel-test/2.14.4
feature:install camel-mail/2.14.4
feature:install camel-quartz/2.14.4

bundle:install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.commons-lang
bundle:install -s mvn:org.apache.httpcomponents/httpcore-osgi/4.2.5

bundle:install -s mvn:org.apache.httpcomponents/httpclient-osgi/4.2.5
bundle:install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.commons-io
bundle:install -s mvn:com.fasterxml.jackson.core/jackson-core/2.1.5
bundle:install -s mvn:com.fasterxml.jackson.core/jackson-annotations/2.1.5
bundle:install -s mvn:com.fasterxml.jackson.core/jackson-databind/2.1.5
bundle:install -s mvn:org.wso2.balana/org.wso2.balana/1.0.0.wso2v8
bundle:install -s mvn:commons-pool/commons-pool/1.6
bundle:install -s mvn:commons-codec/commons-codec/1.6
bundle:install -s mvn:commons-collections/commons-collections/3.2.2
bundle:install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.velocity/1.7_6
bundle:install -s mvn:org.apache.commons/com.springsource.org.apache.commons.dbcp/1.2.2.osgi
bundle:install -s mvn:org.osgi/org.osgi.enterprise/4.2.0
bundle:install -s mvn:com.h2database/h2/1.3.174
bundle:install -s mvn:com.mysql.jdbc/com.springsource.com.mysql.jdbc
bundle:install -s mvn:org.apache.commons/commons-math3/3.2
feature:install spring-jdbc/3.2.14.RELEASE_1
bundle:install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.dom4j
bundle:install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.guava/11_1
bundle:install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.jaxen/1.1.4_2
bundle:install -s mvn:joda-time/joda-time/1.6.2

bundle:install -s mvn:org.ojbc.bundles.utilities/h2-mock-database 
bundle:install mvn:org.ojbc.bundles.shared/ojb-resources-common
bundle:install -s mvn:org.ojbc.bundles.shared/ojb-osgi-common
bundle:install mvn:org.ojbc.bundles.shared/ojb-common
bundle:install mvn:org.ojbc.bundles.shared/ojb-camel-common
bundle:install mvn:org.ojbc.bundles.shared/ojb-fedquery-common

bundle:install mvn:org.ojbc.bundles.shared/Entity_Resolution_Resources
bundle:install -s mvn:org.ojbc.bundles.intermediaries/Entity_Resolution_Service_Intermediary_OSGi
bundle:install -s mvn:org.ojbc.bundles.intermediaries/Entity_Resolution_Service_Intermediary

bundle:install -s mvn:org.ojbc.bundles.intermediaries/person-query-service-warrants-intermediary
bundle:install -s mvn:org.ojbc.bundles.intermediaries/person-query-service-criminal-history-intermediary
bundle:install -s mvn:org.ojbc.bundles.intermediaries/firearm-registration-query-request-service-intermediary
bundle:install -s mvn:org.ojbc.bundles.intermediaries/incident-report-request-service-intermediary
bundle:install -s mvn:org.ojbc.bundles.intermediaries/juvenile-history-service-intermediary

bundle:install -s mvn:org.ojbc.bundles.intermediaries/firearm-search-request-service-intermediary
bundle:install -s mvn:org.ojbc.bundles.intermediaries/person-search-request-service-intermediary
bundle:install -s mvn:org.ojbc.bundles.intermediaries/incident-search-request-service-intermediary
bundle:install -s mvn:org.ojbc.bundles.intermediaries/vehicle-search-request-service-intermediary

bundle:install -s mvn:org.ojbc.bundles.adapters/static-mock-adapter-osgi
bundle:install -s mvn:org.ojbc.bundles.adapters/static-mock-adapter
bundle:install -s mvn:org.ojbc.bundles.intermediaries/subscription-notification-service-intermediary-common
bundle:install -s mvn:org.ojbc.bundles.adapters/rapback-data-store-adapter

bundle:install -s mvn:org.ojbc.bundles.intermediaries/organization-identification-results-query-service-intermediary
bundle:install -s mvn:org.ojbc.bundles.intermediaries/organization-identification-results-search-service-intermediary

bundle:install -s mvn:org.ojbc.bundles.intermediaries/policy-acknowledgement-service-intermediary
bundle:install -s mvn:org.ojbc.bundles.shared/ojb-policy-decision-point-service

bundle:install mvn:org.ojbc.bundles.intermediaries/subscription-notification-service-intermediary-common
bundle:install -s mvn:org.ojbc.bundles.intermediaries/subscription-notification-service-intermediary
bundle:install -s mvn:org.ojbc.bundles.intermediaries/identification-reporting-service-intermediary

bundle:install -s mvn:org.ojbc.bundles.intermediaries/court-case-search-service-intermediary
bundle:install -s mvn:org.ojbc.bundles.intermediaries/court-case-query-service-intermediary
bundle:install -s mvn:org.ojbc.bundles.intermediaries/custody-search-request-service-intermediary
bundle:install -s mvn:org.ojbc.bundles.intermediaries/custody-query-service-intermediary
bundle:install -s mvn:org.ojbc.bundles.intermediaries/person-query-service-vehicle-crash-intermediary
