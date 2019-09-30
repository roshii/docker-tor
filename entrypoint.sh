#!/bin/sh
set -e

chown -R debian-tor /var/lib/tor
exec gosu tor -f /var/lib/tor/torrc
