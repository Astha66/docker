#! /bin/bash

#set -x

# Start up the server so we can hit the REST API

cd /opt/pentaho/biserver-ce
sed -i "s/.\/catalina.sh run/sh startup.sh/g" start-pentaho.sh
./start-pentaho.sh

# The list of users is a convenient service to hit to test whether the API is up and running...
CURLTEST='curl -s -u Admin:password http://localhost/pentaho/api/userroledao/users | xmllint --format --recover - '

eval $CURLTEST >> /dev/null 2>&1
while [ $? -ne 0 ]; do
	sleep 5
	echo "Testing availability of Pentaho server..."
   eval $CURLTEST >> /dev/null 2>&1
done

echo "Original user list:"
eval $CURLTEST

echo "Adding users to Pentaho..."

echo "<user><userName>demoadmin@ojbc.org</userName><password>password</password></user>" | curl -s -u Admin:password --header "Content-Type: application/xml" -T - http://localhost/pentaho/api/userroledao/createUser
echo "<user><userName>demouser1@ojbc.org</userName><password>password</password></user>" | curl -s -u Admin:password --header "Content-Type: application/xml" -T - http://localhost/pentaho/api/userroledao/createUser
echo "<user><userName>demouser2@ojbc.org</userName><password>password</password></user>" | curl -s -u Admin:password --header "Content-Type: application/xml" -T - http://localhost/pentaho/api/userroledao/createUser

echo "Removing fake Pentaho users..."

# note undocumented "feature" of pentaho REST API is to separate the values with tabs...
curl -s -u Admin:password --header "Content-Type: application/xml" -X PUT http://localhost/pentaho/api/userroledao/deleteUsers?userNames=suzy%09pat%09tiffany

echo "New user list:"
eval $CURLTEST

echo "Installing default database connection..."
curl -s -u Admin:password --header "Content-Type: application/json" -T /tmp/ojbc_analytics_demo-connection.json http://localhost/pentaho/plugin/data-access/api/datasource/jdbc/connection/ojbc_analytics_demo
echo "Database connections:"
curl -s -u Admin:password http://localhost/pentaho/plugin/data-access/api/datasource/jdbc/connection

echo "Installing demo Mondrian schema..."
curl -sSL https://raw.githubusercontent.com/ojbc/analytics/master/incident-arrest/OJBMondrianSchema.xml -o /tmp/OJBMondrianSchema.xml
sed -i "s/OJBC Analytics/OJBC Analytics Demo/g" /tmp/OJBMondrianSchema.xml
curl -s -u Admin:password -F parameters="Datasource=ojbc_analytics_demo;overwrite=true" -F uploadAnalysis="@/tmp/OJBMondrianSchema.xml;filename=OJBMondrianSchema.xml;type=text/xml" http://localhost/pentaho/plugin/data-access/api/mondrian/postAnalysis
echo "Analysis Data Sources:"
curl -s -u Admin:password http://localhost/pentaho/plugin/data-access/api/datasource/analysis/catalog | xmllint --format --recover -

echo "Installing Saiku plugin..."
curl -s -u Admin:password -X POST http://localhost/pentaho/plugin/marketplace/api/plugin/saiku/STABLE
cp /tmp/saiku.min.js /opt/pentaho/biserver-ce/pentaho-solutions/system/saiku/ui/
echo "Installing IvyBC plugin..."
curl -s -u Admin:password -X POST http://localhost/pentaho/plugin/marketplace/api/plugin/IvyBC/STABLE
echo "Installing Pivot4j plugin..."
curl -s -u Admin:password -X POST http://localhost/pentaho/plugin/marketplace/api/plugin/pivot4j/Development

echo "Installing OJB Demo Dashboards..."
curl -s -u Admin:password -X PUT http://localhost/pentaho/api/repo/dirs/%3Apublic%3AOJB%2520Dashboards
curl -sSL https://raw.githubusercontent.com/ojbc/analytics/master/incident-arrest/dashboards/IncidentDashboard.cda -o /tmp/IncidentDashboard.cda
curl -sSL https://raw.githubusercontent.com/ojbc/analytics/master/incident-arrest/dashboards/IncidentDashboard.cdfde -o /tmp/IncidentDashboard.cdfde
curl -sSL https://raw.githubusercontent.com/ojbc/analytics/master/incident-arrest/dashboards/IncidentDashboard.wcdf -o /tmp/IncidentDashboard.wcdf
curl -sSL https://raw.githubusercontent.com/ojbc/analytics/master/incident-arrest/dashboards/DrugCrimeDashboard.cda -o /tmp/DrugCrimeDashboard.cda
curl -sSL https://raw.githubusercontent.com/ojbc/analytics/master/incident-arrest/dashboards/DrugCrimeDashboard.cdfde -o /tmp/DrugCrimeDashboard.cdfde
curl -sSL https://raw.githubusercontent.com/ojbc/analytics/master/incident-arrest/dashboards/DrugCrimeDashboard.wcdf -o /tmp/DrugCrimeDashboard.wcdf
curl -sSL https://raw.githubusercontent.com/ojbc/analytics/master/incident-arrest/dashboards/PretrialServicesDashboard.cda -o /tmp/PretrialServicesDashboard.cda
curl -sSL https://raw.githubusercontent.com/ojbc/analytics/master/incident-arrest/dashboards/PretrialServicesDashboard.cdfde -o /tmp/PretrialServicesDashboard.cdfde
curl -sSL https://raw.githubusercontent.com/ojbc/analytics/master/incident-arrest/dashboards/PretrialServicesDashboard.wcdf -o /tmp/PretrialServicesDashboard.wcdf
sleep 3
curl -s -u Admin:password -F fileUpload='@/tmp/IncidentDashboard.cda;filename="IncidentDashboard.cda"' -F importDir="/public/OJB Dashboards" http://localhost/pentaho/api/repo/files/import
curl -s -u Admin:password -F fileUpload='@/tmp/IncidentDashboard.cdfde;filename="IncidentDashboard.cdfde"' -F importDir="/public/OJB Dashboards" http://localhost/pentaho/api/repo/files/import
curl -s -u Admin:password -F fileUpload='@/tmp/IncidentDashboard.wcdf;filename="IncidentDashboard.wcdf"' -F importDir="/public/OJB Dashboards" http://localhost/pentaho/api/repo/files/import
curl -s -u Admin:password -F fileUpload='@/tmp/DrugCrimeDashboard.cda;filename="DrugCrimeDashboard.cda"' -F importDir="/public/OJB Dashboards" http://localhost/pentaho/api/repo/files/import
curl -s -u Admin:password -F fileUpload='@/tmp/DrugCrimeDashboard.cdfde;filename="DrugCrimeDashboard.cdfde"' -F importDir="/public/OJB Dashboards" http://localhost/pentaho/api/repo/files/import
curl -s -u Admin:password -F fileUpload='@/tmp/DrugCrimeDashboard.wcdf;filename="DrugCrimeDashboard.wcdf"' -F importDir="/public/OJB Dashboards" http://localhost/pentaho/api/repo/files/import
curl -s -u Admin:password -F fileUpload='@/tmp/PretrialServicesDashboard.cda;filename="PretrialServicesDashboard.cda"' -F importDir="/public/OJB Dashboards" http://localhost/pentaho/api/repo/files/import
curl -s -u Admin:password -F fileUpload='@/tmp/PretrialServicesDashboard.cdfde;filename="PretrialServicesDashboard.cdfde"' -F importDir="/public/OJB Dashboards" http://localhost/pentaho/api/repo/files/import
curl -s -u Admin:password -F fileUpload='@/tmp/PretrialServicesDashboard.wcdf;filename="PretrialServicesDashboard.wcdf"' -F importDir="/public/OJB Dashboards" http://localhost/pentaho/api/repo/files/import
sleep 3

# Put the server startup script back in "foreground" mode
sed -i "s/sh startup.sh/.\/catalina.sh run/g" start-pentaho.sh