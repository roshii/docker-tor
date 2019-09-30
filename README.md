# docker-obfs4-bridge

[![Docker Stars](https://img.shields.io/docker/stars/r0shii/obfs4-bridge.svg)](https://hub.docker.com/r/r0shii/obfs4-bridge/)
[![Docker Pulls](https://img.shields.io/docker/pulls/r0shii/obfs4-bridge.svg)](https://hub.docker.com/r/r0shii/obfs4-bridge/)

Forked from https://dip.torproject.org/torproject/anti-censorship/docker-obfs4-bridge

This repository contains the docker files for an obfs4 Tor bridge.

## Deploying the container

This image requires mounting `torrc` file using docker `volume` option such as follows.

`--volume /path/to/torrc/on/host:/var/lib/tor`

Tor can't help you if you use it wrong! Learn how to be safe at https://www.torproject.org/download/download#warning
