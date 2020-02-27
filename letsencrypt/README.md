Example for Using Cerbot and Lets Encrypt to create and manage certs (Apache)

Example is for test.ojbc.org

Step 1: Build the cerbot image:
	docker-compose -f certbot-image.yaml build

Step 2: Create the following directories on the host server:
	/opt/apache-certs
	/opt/apache-webroot/.well-known/acme-challenge
	/opt/data/search/docker-mounts/letsencrypt-etc
	
Step 3: Make sure to share the host server directories in Step 2 in Docker

Step 4: Build/Run the apache proxy server: 
	docker-compose -f test-ojbc-org.yaml up -d

Note the following host:container mounts required for the Apache container
	/opt/apache-webroot:/usr/local/apache2/htdocs  -  ONLY REQUIRED AT CERT CREATION
	/opt/apache-certs:/apache-certs
	/opt/data/search/docker-mounts/letsencrypt-etc:/opt/data/search/docker-mounts/letsencrypt-etc

Step 5: Run letsencrypt-create.sh to check letsencrypt connectivity and to get certs

IMPORTANT NOTES:
 - Congratulations! Your certificate and chain have been saved at:
   /etc/letsencrypt/live/test.ojbc.org/fullchain.pem
   Your key file has been saved at:
   /etc/letsencrypt/live/test.ojbc.org/privkey.pem
   Your cert will expire on 2020-05-23. To obtain a new or tweaked
   version of this certificate in the future, simply run certbot
   again. To non-interactively renew *all* of your certificates, run
   "certbot renew"
   
This script will build the letsenctrypt-etc folders on the host and puts certs in the "live" folder (Note: The "certs" in the Live folder are actually links to the Archive folder!)


Step 6: 

Change to following in the ssl.conf in the proxy server:

SSLCertificateFile /opt/data/search/docker-mounts/letsencrypt-etc/live/test.ojbc.org/fullchain.pem
SSLCertificateKeyFile /opt/data/search/docker-mounts/letsencrypt-etc/live/test.ojbc.org/privkey.pem

Comment out the following in the Dockerfile:
#COPY files/test.ojbc.org.crt /opt/ojbc/certs/test.ojbc.org.crt
#COPY files/test.ojbc.org.key /opt/ojbc/certs/test.ojbc.org.key

Restart the proxy server with the new letsencrypt certs

	
Step 7: Add to /etc/crontab  -  10 0   1 */2 * root    /etc/local/letsencrypt-renewal.sh

Step 8: add file letsencrypt-renewal.sh to /etc/local


NOTES: 

TO Run cerbot interactively

docker run -it --rm \
--mount type=bind,source=/apache-certs,target=/apache-certs \
--mount type=bind,source=/apache-webroot,target=/apache-webroot \
--mount type=bind,source=/opt/data/search/docker-mounts/letsencrypt-etc,target=/etc/letsencrypt \
--name cerbot ojbc/certbot



https://certbot.eff.org/docs/using.html#where-are-my-certificates

This is what Apache needs for SSLCertificateKeyFile, and Nginx for ssl_certificate_key.

fullchain.pem
All certificates, including server certificate (aka leaf certificate or end-entity certificate). The server certificate is the first one in this file, followed by any intermediates.

This is what Apache >= 2.4.8 needs for SSLCertificateFile, and what Nginx needs for ssl_certificate.


