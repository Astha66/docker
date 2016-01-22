#! /bin/bash

#set -x

cd /tmp
gunzip ojbc_analytics_demo.sql.gz

/usr/bin/mysqld_safe --user=root &
until /usr/bin/mysqladmin -u root status > /dev/null 2>&1; do sleep 1; done

echo "create database ojbc_analytics_demo" | mysql -u root
mysql -u root ojbc_analytics_demo < /tmp/ojbc_analytics_demo.sql
rm -f /tmp/ojbc_analytics_demo.sql