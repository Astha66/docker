FROM frolvlad/alpine-glibc

MAINTAINER Open Justice Broker Consortium "http://www.ojbc.org"

RUN apk add --update bash apache2 apache2-ssl alpine-sdk openssl openssl-dev boost-dev curl-dev bzip2-dev

# This loosely follows the steps documented at https://wiki.shibboleth.net/confluence/display/SHIB2/NativeSPLinuxSourceBuild

WORKDIR /tmp

# Install Boost

RUN curl -L -o boost_1_52_0.tar.gz http://sourceforge.net/projects/boost/files/boost/1.52.0/boost_1_52_0.tar.gz/download && \
	tar -xvf boost_1_52_0.tar.gz && \
	cd boost_1_52_0 && \
	./bootstrap.sh && \
	./b2 install && \
	cd .. && rm -rf boost*
	
# Install log4shib

RUN wget http://shibboleth.net/downloads/log4shib/latest/log4shib-1.0.9.tar.gz && \
	tar -xvf log4shib-1.0.9.tar.gz && \
	cd log4shib-1.0.9 && \
	./configure --disable-static --disable-doxygen --prefix=/opt/shibboleth-sp CXXFLAGS="-std=c++11" && \
	make && \
	make install && \
	cd .. && rm -rf log4shib*
	
# Install XercesC

RUN wget http://www.apache.org/dist/xerces/c/3/sources/xerces-c-3.1.2.tar.gz && \
	tar -xvf xerces-c-3.1.2.tar.gz && \
	cd xerces-c-3.1.2 && \
	./configure --prefix=/opt/shibboleth-sp --disable-netaccessor-libcurl && \
	make && \
	make install && \
	cd .. && rm -rf xerces-c*

# Install XML Security
	
RUN wget http://www.apache.org/dist/santuario/c-library/xml-security-c-1.7.3.tar.gz && \
	tar -xvf xml-security-c-1.7.3.tar.gz && \
	cd xml-security-c-1.7.3 && \
	./configure --without-xalan --disable-static --prefix=/opt/shibboleth-sp --with-xerces=/opt/shibboleth-sp && \
	make && \
	make install && \
	cd .. && rm -rf xml-sec*

# Install OpenSAML XML Tooling
	
RUN wget http://shibboleth.net/downloads/c++-opensaml/latest/xmltooling-1.5.6.tar.gz && \
	tar -xvf xmltooling-1.5.6.tar.gz && \
	cd xmltooling-1.5.6 && \
	./configure --with-log4shib=/opt/shibboleth-sp --prefix=/opt/shibboleth-sp -C && \
	make && \
	make install && \
	cd .. && rm -rf xmltooling*

# Install OpenSAML
	
RUN wget http://shibboleth.net/downloads/c++-opensaml/latest/opensaml-2.5.5.tar.gz && \
	tar -xvf opensaml-2.5.5.tar.gz && \
	cd opensaml-2.5.5 && \
	./configure --with-log4shib=/opt/shibboleth-sp --prefix=/opt/shibboleth-sp -C && \
	make && \
	make install && \
	cd .. && rm -rf opensaml*

# Install Shib daemon
	
RUN wget http://shibboleth.net/downloads/service-provider/latest/shibboleth-sp-2.5.5.tar.gz && \
	tar -xvf shibboleth-sp-2.5.5.tar.gz && \
	cd shibboleth-sp-2.5.5 && \
	apk add --update apache2-dev && \
	./configure --with-log4shib=/opt/shibboleth-sp --prefix=/opt/shibboleth-sp --enable-apache-24 --with-apxs24=/usr/bin/apxs && \
	make && \
	make install && \
	cd .. && rm -rf shibboleth* && \
	apk del apache2-dev

# Copy config files over and do some editing
	
COPY files/* /opt/shibboleth-sp/etc/shibboleth/

RUN sed -i s/SSLMutex/#SSLMutex/g /etc/apache2/conf.d/ssl.conf && \
	sed -i "s/#ServerName.*/ServerName www.ojbc.local:80/g" /etc/apache2/httpd.conf && \
	sed -i "s/UseCanonicalName Off/UseCanonicalName On/g" /etc/apache2/httpd.conf && \
	ln -s /opt/shibboleth-sp/etc/shibboleth/shib.conf /etc/apache2/conf.d/shib.conf
	
# Make startup script
	
RUN echo '#!/bin/bash' > /opt/shibboleth-sp/sbin/start-shib-and-apache && \
	echo "/opt/shibboleth-sp/sbin/shibd -f" >> /opt/shibboleth-sp/sbin/start-shib-and-apache && \
	echo "apachectl start -DFOREGROUND" >> /opt/shibboleth-sp/sbin/start-shib-and-apache && \
	chmod u+x /opt/shibboleth-sp/sbin/start-shib-and-apache

WORKDIR /opt/shibboleth-sp

CMD ["/opt/shibboleth-sp/sbin/start-shib-and-apache"]
