#!/bin/sh
set -e

exec gosu debian-tor tor -f /var/lib/tor/torrc
