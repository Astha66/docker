cd /tmp

/usr/bin/mysqld_safe --user=root &

until /usr/bin/mysqladmin -u root status > /dev/null 2>&1; do sleep 1; done

echo "CREATE DATABASE rapback_datastore"| mysql -u root

# Create database
gunzip schema-mysql.sql.gz
mysql -u root rapback_datastore < /tmp/schema-mysql.sql
rm -f /tmp/schema-mysql.sql

# Load demo data
gunzip load-code-tables.sql.gz
mysql -u root rapback_datastore < /tmp/load-code-tables.sql
rm -f /tmp/load-code-tables.sql