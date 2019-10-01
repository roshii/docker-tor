# docker-tor

[![Docker Stars](https://img.shields.io/docker/stars/r0shii/tor.svg)](https://hub.docker.com/r/r0shii/tor/)
[![Docker Pulls](https://img.shields.io/docker/pulls/r0shii/tor.svg)](https://hub.docker.com/r/r0shii/tor/)

This repository contains the docker files required to run Tor, as a simple 
proxy, obfs4 bridge or relay. Tor data will persist on the mounted volume.

## Deploying the container

This image requires mounting `torrc` file using docker `volume` option such as follows.

`--volume /path/to/torrc/on/host:/var/lib/tor`

Tor can't help you if you use it wrong! Learn how to be safe at https://www.torproject.org/download/download#warning
