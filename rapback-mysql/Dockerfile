FROM ojbc/mysql

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

WORKDIR /tmp
#

#COPY files/server-config.sh /tmp
COPY files/server-config-dev.sh /tmp
COPY files/schema-mysql.sql.gz /tmp
COPY files/load-code-tables.sql.gz /tmp

RUN chmod a+x /tmp/server-config-dev.sh
RUN /tmp/server-config-dev.sh

WORKDIR /usr

CMD ["bin/mysqld_safe", "--user=root"]