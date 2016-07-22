#! /bin/bash

#set -x

cd /tmp
gunzip ojbc_analytics_demo.sql.gz

/usr/bin/mysqld_safe --user=root &
until /usr/bin/mysqladmin -u root status > /dev/null 2>&1; do sleep 1; done

echo "create database ojbc_analytics_demo" | mysql -u root
mysql -u root ojbc_analytics_demo < /tmp/ojbc_analytics_demo.sql
rm -f /tmp/ojbc_analytics_demo.sql

gunzip nibrs_analytics.sql.gz

echo "create database nibrs_analytics" | mysql -u root
mysql -u root nibrs_analytics < /tmp/nibrs_analytics.sql
rm -f /tmp/nibrs_analytics.sql
