# Base docker image
FROM debian:buster-slim

LABEL maintainer="roshii <roshii@riseup.net>"

# Install dependencies
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -y \
    tor \
    tor-geoipdb \
    obfs4proxy \
    --no-install-recommends

# Our torrc resides on the host, linked with `volume` option
RUN rm /etc/tor/torrc
RUN chown debian-tor:debian-tor /etc/tor
RUN chown debian-tor:debian-tor /var/log/tor

COPY start-tor.sh /usr/local/bin
RUN chmod 0755 /usr/local/bin/start-tor.sh

USER debian-tor

ENTRYPOINT ["tor", "-f", "/etc/tor/torrc"]
