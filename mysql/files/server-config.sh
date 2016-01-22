#! /bin/bash

#set -x

cd /tmp

/usr/bin/mysqld_safe --user=root &

until /usr/bin/mysqladmin -u root status > /dev/null 2>&1; do sleep 1; done

# Allow other machines in the Weave network to connect, but no others
# In a secured setup, you would not allow the root user to connect, but for demo purposes, works fine...
echo "GRANT ALL PRIVILEGES ON *.* TO 'root'@'10.32.0.%' WITH GRANT OPTION" | mysql -u root
