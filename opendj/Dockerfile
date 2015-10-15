FROM java-server-base

COPY bin/opendj-server-2.6.0.zip /opt/

RUN apt-get install -y unzip
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

#    /opt/opendj/bin/ldappasswordmodify -p 1389 --trustAll -D cn=Directory\ Manager -w password -h localhost --currentPassword --newPassword=password -a "dn: cn=demoadmin,ou=People,dc=ojbc-local,dc=org" && \

    
CMD ["/opt/opendj/bin/start-ds", "--nodetach"]

