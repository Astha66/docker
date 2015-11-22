FROM java7-server-base

COPY bin/opendj-server-2.6.0.zip /opt/

RUN apk add --update unzip
RUN cd /opt && unzip opendj-server-2.6.0.zip

ENV ROOT_USER_DN cn=Directory\ Manager
ENV ROOT_USER_PASS password
ENV BASE_DN dc=ojbc-local,dc=org

WORKDIR /opt/opendj
RUN ./setup --cli -v \
  --ldapPort 1389 \
  --adminConnectorPort 4444 \
  --rootUserDN "$ROOT_USER_DN" \
  --rootUserPassword $ROOT_USER_PASS \
  --no-prompt --noPropertiesFile \
  --doNotStart

EXPOSE 1389 4444

COPY files/setup.ldif /tmp/
  
RUN /opt/opendj/bin/start-ds && \
    /opt/opendj/bin/dsconfig create-backend --backend-name userRoot --type=local-db --set base-dn:dc=ojbc-local,dc=org --set enabled:true --noPropertiesFile --no-prompt -p 4444 --trustAll -w password -h localhost && \
    /opt/opendj/bin/import-ldif -b dc=ojbc-local,dc=org -n userRoot -l /tmp/setup.ldif -t 0 -p 4444 --trustAll -w password -h localhost && \
    /opt/opendj/bin/stop-ds

# to test this container:
# docker build -t opendj .
# docker run -P opendj
# substitute the appropriate IP address and port for your setup...
# ldapwhoami -x -h 192.168.99.101 -p 32769 -D "cn=demoadmin,ou=People,dc=ojbc-local,dc=org" -w password -v
    
CMD ["/opt/opendj/bin/start-ds", "--nodetach"]

