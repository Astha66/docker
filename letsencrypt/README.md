Using Certbot and Lets Encrypt to create and manage certs (Apache example)

CERTBOT - enable HTTPS on your website with EFF's Certbot, deploying Let's Encrypt certificates.

Example is for test.ojbc.org

Step 1: Login to docker

	Docker login "userID"
	
Step 2: Copy the following scripts/folder to /opt/ojbc/letsencrypt on the server (EDIT THE DOMAIN and EMAIL, etc in the .sh's):

	letsencrypt-create.sh
	letsencrypt-renewal.sh
	certbot
	letsencrypt.yaml
		
Step 3: Create the following directories on the host server:

	/opt/apache-certs
	/opt/apache-webroot/.well-known/acme-challenge
	/opt/data/search/docker-mounts/letsencrypt-etc
	
Step 4: Run letsencrypt-create.sh to get letsencrypt certs
 
	This script will build the letsenctrypt-etc folders on the host and puts certs in the "live" folder (Note: The "certs" in the Live folder are actually links to the Archive folder!)
	
	The script performs the following tasks:
		- Changes directory to /opt/ojbc/letsencrypt
		- Stops the Apache Proxy Server
		- Builds the Certbot image
		- Runs the apache proxy container with the letsencrypt configuration
		- Creates the Letsencrypt certs
		- Stops the [letsencrypt] apache proxy server
		- Changes directory
		- Restarts the apache proxy server

Step 5: Add the following line to /etc/crontab to renew the certs in a 2 month interval:

	10 0   1 */2 * root    /opt/ojbc/letsencrypt/letsencrypt-renewal.sh

[FOR FIRST TIME IMPLEMENTATION]...

Step 6: Change to following in the ssl.conf in the proxy server:

	SSLCertificateFile /etc/letsencrypt/live/test.ojbc.org/fullchain.pem
	SSLCertificateKeyFile /etc/letsencrypt/live/test.ojbc.org/privkey.pem

Step 7: Comment out the "manual certs" in the proxy Dockerfile if there:

	COPY files/test.ojbc.org.crt /opt/ojbc/certs/test.ojbc.org.crt
	COPY files/test.ojbc.org.crt /opt/ojbc/certs/test.ojbc.org.key

Step 8: Restart the apache proxy server

	docker-compose -f test-ojbc-proxy.yaml up -d test-ojbc-proxy
	


NOTES: 

	https://certbot.eff.org/docs/using.html#where-are-my-certificates


	TO Run cerbot interactively:

	docker run -it --rm \
	--mount type=bind,source=/opt/apache-certs,target=/apache-certs \
	--mount type=bind,source=/opt/apache-webroot,target=/apache-webroot \
	--mount type=bind,source=/opt/data/search/docker-mounts/letsencrypt-etc,target=/etc/letsencrypt \
	--name cerbot ojbc/certbot
