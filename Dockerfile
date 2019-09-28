# Base docker image
FROM debian:buster-slim

LABEL maintainer="roshii <roshii@riseup.net>"

# Install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    apt-utils \
    tor \
    tor-geoipdb \
    obfs4proxy \
    --no-install-recommends \
    && rm -rf /var/lib/apt/lists/*

# Our torrc resides on the host, linked with `volume` option
RUN rm /etc/tor/torrc
RUN chown debian-tor:debian-tor /etc/tor
RUN chown debian-tor:debian-tor /var/log/tor
RUN mkdir /var/lib/tor/hidden_service
RUN chown debian-tor:debian-tor /var/lib/tor/hidden_service

USER debian-tor

ENTRYPOINT ["tor", "-f", "/etc/tor/torrc"]
