FROM apereo/cas:v4.2.2

WORKDIR /cas-overlay

COPY etc/cas.properties /etc/cas/cas.properties
COPY etc/thekeystore /etc/cas/jetty/

COPY etc/*.json /cas-overlay/src/main/resources/services/

COPY install.sh /cas-overlay

RUN cd /cas-overlay && ./install.sh

CMD ["/cas-overlay/bin/run-jetty.sh"]