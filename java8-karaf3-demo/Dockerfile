
# Dockerfile to build a Karaf container

FROM ojbc/java8-karaf3

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR $KARAF_HOME

COPY files/org.apache.karaf.features.cfg etc/
COPY files/ojbc.context.services.cfg etc/
COPY files/org.ops4j.pax.url.mvn.cfg etc/

WORKDIR $KARAF_HOME/deploy

RUN curl -O http://repo1.maven.org/maven2/org/apache/servicemix/bundles/org.apache.servicemix.bundles.commons-lang/2.4_6/org.apache.servicemix.bundles.commons-lang-2.4_6.jar && \
curl -O http://repo1.maven.org/maven2/org/apache/httpcomponents/httpclient-osgi/4.2.5/httpclient-osgi-4.2.5.jar && \
curl -O http://repo1.maven.org/maven2/org/apache/servicemix/bundles/org.apache.servicemix.bundles.commons-io/1.4_3/org.apache.servicemix.bundles.commons-io-1.4_3.jar && \
curl -O http://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-core/2.1.5/jackson-core-2.1.5.jar && \
curl -O http://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-annotations/2.1.5/jackson-annotations-2.1.5.jar && \
curl -O http://repo1.maven.org/maven2/com/fasterxml/jackson/core/jackson-databind/2.1.5/jackson-databind-2.1.5.jar && \
curl -O http://maven.wso2.org/nexus/content/repositories/releases/org/wso2/balana/org.wso2.balana/1.0.0.wso2v8/org.wso2.balana-1.0.0.wso2v8.jar && \
curl -O http://repo1.maven.org/maven2/commons-pool/commons-pool/1.6/commons-pool-1.6.jar && \
curl -O http://repo1.maven.org/maven2/commons-codec/commons-codec/1.6/commons-codec-1.6.jar && \
curl -O http://repo1.maven.org/maven2/commons-collections/commons-collections/3.2.2/commons-collections-3.2.2.jar && \
curl -O http://repo1.maven.org/maven2/org/apache/servicemix/bundles/org.apache.servicemix.bundles.velocity/1.7_6/org.apache.servicemix.bundles.velocity-1.7_6.jar && \
curl -O https://maven.alfresco.com/nexus/content/groups/public/org/apache/commons/com.springsource.org.apache.commons.dbcp/1.2.2.osgi/com.springsource.org.apache.commons.dbcp-1.2.2.osgi.jar && \
curl -O http://repo1.maven.org/maven2/org/osgi/org.osgi.enterprise/4.2.0/org.osgi.enterprise-4.2.0.jar && \
curl -O http://repo1.maven.org/maven2/com/h2database/h2/1.3.174/h2-1.3.174.jar && \
curl -O http://maven.wso2.org/nexus/content/repositories/SpringSource-Enterprise-Bundle-Repository/com/mysql/jdbc/com.springsource.com.mysql.jdbc/5.1.6/com.springsource.com.mysql.jdbc-5.1.6.jar && \
curl -O http://repo1.maven.org/maven2/org/apache/commons/commons-math3/3.2/commons-math3-3.2.jar && \
curl -O http://repo1.maven.org/maven2/org/apache/servicemix/bundles/org.apache.servicemix.bundles.dom4j/1.6.1_5/org.apache.servicemix.bundles.dom4j-1.6.1_5.jar && \
curl -O http://repo1.maven.org/maven2/org/apache/servicemix/bundles/org.apache.servicemix.bundles.guava/11_1/org.apache.servicemix.bundles.guava-11_1.jar && \
curl -O http://repo1.maven.org/maven2/org/apache/servicemix/bundles/org.apache.servicemix.bundles.jaxen/1.1.4_2/org.apache.servicemix.bundles.jaxen-1.1.4_2.jar && \
curl -O http://repo1.maven.org/maven2/joda-time/joda-time/1.6.2/joda-time-1.6.2.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/utilities/h2-mock-database/2.0.0/h2-mock-database-2.0.0.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/shared/ojb-resources-common/1.0.0/ojb-resources-common-1.0.0.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/shared/ojb-osgi-common/2.0.0/ojb-osgi-common-2.0.0.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/shared/ojb-common/3.0.0/ojb-common-3.0.0.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/shared/ojb-camel-common/2.0.0/ojb-camel-common-2.0.0.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/shared/ojb-fedquery-common/2.0.0/ojb-fedquery-common-2.0.0.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/intermediaries/policy-acknowledgement-service-intermediary/1.0.1/policy-acknowledgement-service-intermediary-1.0.1.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/shared/ojb-policy-decision-point-service/1.0.1/ojb-policy-decision-point-service-1.0.1.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/adapters/static-mock-adapter-osgi/1.0.16/static-mock-adapter-osgi-1.0.16.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/adapters/static-mock-adapter/1.0.7/static-mock-adapter-1.0.7.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/intermediaries/person-search-request-service-intermediary/1.1.0/person-search-request-service-intermediary-1.1.0.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/intermediaries/subscription-notification-service-intermediary-common/2.0.0/subscription-notification-service-intermediary-common-2.0.0.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/adapters/rapback-data-store-adapter/1.0.1/rapback-data-store-adapter-1.0.1.jar && \
curl -O http://repo1.maven.org/maven2/org/ojbc/bundles/intermediaries/identification-reporting-service-intermediary/1.0.0/identification-reporting-service-intermediary-1.0.0.jar

# see parent for run comments
CMD ["karaf", "server"]
