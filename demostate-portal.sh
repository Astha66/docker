# to run this, first you must:
#
# 1. install the tap1 interface (run dockerbridge)
# 2. run the local-network-compose.yaml in docker-compose (up -d)

docker run -d --name apacheds --net bnet --ip 172.18.0.5 -e SERVICE_NAME=apacheds --expose 389 ojbc/apacheds