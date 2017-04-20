#!/bin/bash
if [ ! -f /var/lib/mosquitto/mosquitto.acl ]
then
    touch /var/lib/mosquitto/mosquitto.acl
fi

if [ ! -f /var/lib/mosquitto/mosquitto.pwd ]
then
    touch /var/lib/mosquitto/mosquitto.pwd
fi

/usr/local/sbin/mosquitto -c /etc/mosquitto/mosquitto.conf