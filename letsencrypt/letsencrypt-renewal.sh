#!/bin/bash
echo
echo CHANGING DIRECTORY...
wait
echo
echo STOPPING APACHE PROXY SERVER...
echo
docker rm -f test-ojbc-proxy
wait
echo
echo BUILDING CERTBOT IMAGE...
echo
docker build -t ojbc/certbot certbot
wait
echo
echo RUNNING PROXY CONTAINER WITH CERBOT CONFIGURATION ...
echo
docker-compose -f letsencrypt.yaml up -d
wait
echo
echo CREATING LETSENCRYPT CERTS ...
echo
docker run -it --rm \
--mount type=bind,source=/opt/apache-certs,target=/apache-certs \
--mount type=bind,source=/opt/apache-webroot,target=/apache-webroot \
--mount type=bind,source=/opt/data/search/docker-mounts/letsencrypt-etc,target=/etc/letsencrypt \
--name certbot ojbc/certbot \
certbot certonly --dry-run --force-renewal --webroot -w /apache-webroot -d test.ojbc.org -m jdougla03@gmail.com --agree-tos -n
wait
echo
echo STOPPING LETSENCRYPT APACHE PROXY SERVER...
echo
docker rm -f test-ojbc-proxy
wait
echo
echo RESTARTING APACHE PROXY SERVER...
echo
docker-compose -f test-ojbc-proxy.yaml up -d test-ojbc-proxy