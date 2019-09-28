#!/bin/sh
set -e

chown -R debian-tor /etc/tor
chown -R debian-tor /var/log/tor
exec gosu debian-tor tor -f /etc/tor/torrc
