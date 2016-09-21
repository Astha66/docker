#! /bin/bash

#set -x

apk --update add curl-dev

cd /opt/saiku-server
cp start-saiku.sh temp-start-saiku.sh
sed -i "s/\/opt\/saiku-server\/tomcat\/bin\/catalina.sh run/sh startup.sh/g" /opt/saiku-server/temp-start-saiku.sh
./temp-start-saiku.sh


CURLTEST='curl -s -u admin:admin http://localhost/saiku/rest/saiku/api/license'

eval $CURLTEST >> /dev/null 2>&1
while [ $? -ne 0 ]; do
       	sleep 5
       	echo "Testing availability of Saiku server..."
   eval $CURLTEST >> /dev/null 2>&1
done

curl -X POST -T /tmp/license_saiku.ojbc.local.lic --header "Content-Type:application/x-java-serialized-object" -u admin:admin http://localhost/saiku/rest/saiku/api/license

/opt/saiku-server/stop-saiku.sh
rm temp-start-saiku.sh

apk del curl-dev