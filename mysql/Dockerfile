FROM alpine

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN apk add --update bash mariadb mariadb-client

WORKDIR /usr

# Obviously you wouldn't want to do this on a real server...but for our sandbox it will make things easy
RUN	echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION;" > /tmp/grant.sql

RUN bin/mysql_install_db --user=root

CMD ["bin/mysqld_safe", "--user=root", "--init-file=/tmp/grant.sql"]