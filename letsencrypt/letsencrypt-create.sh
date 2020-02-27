docker run -it --rm \
--mount type=bind,source=/opt/apache-certs,target=/apache-certs \
--mount type=bind,source=/opt/apache-webroot,target=/apache-webroot \
--mount type=bind,source=/opt/data/search/docker-mounts/letsencrypt-etc,target=/etc/letsencrypt \
--name cerbot ojbc/certbot \
certbot certonly --webroot -w /apache-webroot -d test.ojbc.org -m jdougla03@gmail.com --agree-tos -n
