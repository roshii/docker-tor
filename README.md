# docker-obfs4-bridge

Forked from https://dip.torproject.org/torproject/anti-censorship/docker-obfs4-bridge

This repository contains the docker files for an obfs4 Tor bridge.

## Deploying the container

This image requires mounting `torrc` file using docker `volume` option as
follows:

`--volume /path/to/torrc/on/host:/var/lib/tor`
