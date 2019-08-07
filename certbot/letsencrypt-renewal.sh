docker run -it --rm \
--mount type=bind,source=/apache-certs,target=/apache-certs \
--mount type=bind,source=/apache-webroot,target=/apache-webroot \
--mount type=bind,source=/opt/data/search/docker-mounts/letsencrypt-etc,target=/etc/letsencrypt \
--name cerbot ojbc/certbot \
certbot certonly --force-renewal --webroot -w /apache-webroot -d demo.search.org  -n
sudo cp /opt/data/search/docker-mounts/letsencrypt-etc/live/demo.search.org/*.pem /opt/data/search/docker-mounts/demo.search.org
docker restart -t 5 demo-search-proxy
