#!/bin/bash

rm -rf /cas-overlay/etc/cas.properties
rm -rf /cas-overlay/install.sh

ln -s /etc/cas/cas.properties /cas-overlay/etc/cas.properties