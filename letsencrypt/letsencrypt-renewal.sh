docker run -it --rm \
--mount type=bind,source=/opt/apache-certs,target=/apache-certs \
--mount type=bind,source=/opt/apache-webroot,target=/apache-webroot \
--mount type=bind,source=/opt/data/search/docker-mounts/letsencrypt-etc,target=/etc/letsencrypt \
--name cerbot ojbc/certbot \
#certbot certonly --dry-run --force-renewal --webroot -w /apache-webroot -d test.ojbc.org  -n
certbot certonly --force-renewal --webroot -w /apache-webroot -d test.ojbc.org  -n
#sudo cp /opt/data/search/docker-mounts/letsencrypt-etc/live/test.ojbc.org/*.pem /opt/data/search/docker-mounts/test.ojbc.org
docker restart -t 5 test-ojbc-org-proxy
