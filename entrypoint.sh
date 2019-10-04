#!/bin/sh
set -e

chown -R debian-tor /var/lib/tor
exec gosu debian-tor "$@"
