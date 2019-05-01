feature:install camel-saxon/2.14.4
feature:install camel-cxf/2.14.4
feature:install cxf-ws-security/3.0.6
feature:install camel-http4/2.14.4
feature:install camel-test/2.14.4
feature:install camel-mail/2.14.4
feature:install camel-quartz2
feature:install pax-jetty

feature:install spring-security

bundle:install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.commons-lang
bundle:install -s mvn:org.apache.httpcomponents/httpcore-osgi/4.2.5
bundle:install -s mvn:org.apache.httpcomponents/httpclient-osgi/4.2.5
bundle:install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.commons-io

bundle:install -s mvn:com.fasterxml.jackson.core/jackson-core/2.1.5
bundle:install -s mvn:com.fasterxml.jackson.core/jackson-annotations/2.1.5
bundle:install -s mvn:com.fasterxml.jackson.core/jackson-databind/2.1.5

bundle:install -s mvn:commons-pool/commons-pool/1.6
bundle:install -s mvn:commons-codec/commons-codec/1.6
bundle:install -s mvn:commons-collections/commons-collections/3.2.2
bundle:install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.velocity/1.7_6
bundle:install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.commons-dbcp/1.4_3
bundle:install -s mvn:org.osgi/org.osgi.enterprise/4.2.0
bundle:install -s mvn:com.h2database/h2/1.3.174
bundle:install -s mvn:com.mysql.jdbc/com.springsource.com.mysql.jdbc
bundle:install -s mvn:org.apache.commons/commons-math3/3.2

bundle:install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.dom4j
bundle:install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.guava/11_1
bundle:install -s mvn:org.apache.servicemix.bundles/org.apache.servicemix.bundles.jaxen/1.1.4_2
bundle:install -s mvn:joda-time/joda-time/1.6.2
bundle:install -s mvn:org.wso2.balana/org.wso2.balana

bundle:install -s mvn:com.mysql.jdbc/com.springsource.com.mysql.jdbc  
bundle:install -s mvn:org.apache.commons/commons-math3/3.2  
bundle:install -s mvn:org.codehaus.jackson/jackson-core-asl/1.9.5
bundle:install -s mvn:org.codehaus.jackson/jackson-mapper-asl/1.9.5
bundle:install -s mvn:org.codehaus.jackson/jackson-jaxrs/1.9.5
feature:install spring-jdbc/3.2.18.RELEASE_1