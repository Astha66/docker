#! /bin/bash

#set -x

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

echo "Tomcat successfully started"

curl -sSL https://raw.githubusercontent.com/ojbc/analytics/master/incident-arrest/OJBMondrianSchema.xml -o /tmp/OJBMondrianSchema.xml
sed -i "s/OJBC Analytics/Incident-Arrest/g" /tmp/OJBMondrianSchema.xml

curl -X POST --data 'language=en&username=admin&password=admin' http://localhost/saiku/rest/saiku/session

echo "Installing Mondrian schemas..."

curl -s -u admin:admin -F name="Incident-Arrest" -F file="@/tmp/OJBMondrianSchema.xml;filename=OJBMondrianSchema.xml;type=text/xml" http://localhost/saiku/rest/saiku/admin/schema/IncidentArrest/
curl -s -u admin:admin -F name="Jail-Booking" -F file="@/tmp/JailBookingMondrianSchema.xml;filename=JailBookingMondrianSchema.xml;type=text/xml" http://localhost/saiku/rest/saiku/admin/schema/JailBooking/

echo "Installing data sources..."

curl -X POST -u admin:admin --header "Content-Type: application/json" -T /tmp/Incident-Arrest.connection.json http://localhost/saiku/rest/saiku/admin/datasources
curl -X POST -u admin:admin --header "Content-Type: application/json" -T /tmp/Jail-Booking.connection.json http://localhost/saiku/rest/saiku/admin/datasources

/opt/saiku-server/stop-saiku.sh
rm temp-start-saiku.sh
