# Base docker image
FROM debian:buster-slim

LABEL maintainer="Simon Castano <simon@brane.cc>"

# Install OS utilities
RUN set -ex \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	apt-utils --no-install-recommends \
	&& DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

# Install Tor binaries
RUN set -ex \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	gosu tor tor-geoipdb obfs4proxy --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm /etc/tor/torrc

# Copy startup script
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
