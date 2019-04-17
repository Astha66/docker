FROM ojbc/mysql
MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

#This database contains two pre-defined test accounts: testuser1@search.org and testuser2@search.org, both using the password of "password"

COPY files/server-config.sh /tmp
COPY files/lportal.sql.gz /tmp
RUN chmod a+x /tmp/server-config.sh
RUN /tmp/server-config.sh