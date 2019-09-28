# Base docker image
FROM debian:buster-slim

LABEL maintainer="roshii <roshii@riseup.net>"

# Install OS utilities
RUN set -ex \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	apt-utils --no-install-recommends \
	&& DEBIAN_FRONTEND=noninteractive apt-get upgrade -y \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	gosu tor tor-geoipdb obfs4proxy \
	--no-install-recommends \
	&& rm -rf /var/lib/apt/lists/*

# add user and group with default ids
RUN groupadd debian-tor \
	&& useradd -g debian-tor -s /bin/bash -m -d /tor debian-tor

# Our torrc resides on the host, linked with `volume` option
RUN rm /etc/tor/torrc

COPY docker-entrypoint.sh /usr/local/bin/

ENTRYPOINT ["docker-entrypoint.sh"]
