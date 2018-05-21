#! /bin/bash

#set -x

cd /tmp

/usr/bin/mysqld_safe --user=root &

until /usr/bin/mysqladmin -u root status > /dev/null 2>&1; do sleep 1; done

# Allow other machines to connect
# In a secured setup, you would not allow the root user to connect, but for demo purposes, works fine...
echo "CREATE USER 'root'@'%'"| mysql -u root
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'%' WITH GRANT OPTION" | mysql -u root
