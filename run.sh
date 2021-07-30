#!/bin/bash
docker stop cas-server &>/dev/null
docker rm cas-server -f &>/dev/null

docker run -p 8442:8080 -p 8443:8443 -d --name="cas-server" jerry9916/cas-server