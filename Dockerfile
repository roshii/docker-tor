# Base docker image
FROM debian:buster-slim

LABEL maintainer="Simon Castano <simon@brane.cc>"

ARG DEBIAN_FRONTEND=noninteractive

# Install Tor binaries
RUN set -ex \
	&& apt-get update \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
	apt-utils \
	&& apt-get install --no-install-recommends --no-install-suggests -y \
	gosu \
	tor \
	tor-geoipdb \
	obfs4proxy \
	&& apt-get purge --auto-remove -y \
	apt-utils \
	&& apt-get clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm /etc/tor/torrc

VOLUME ["/var/lib/tor"]

ARG OR_PORT=55755
ARG PT_PORT=43462
EXPOSE ${OR_PORT} ${PT_PORT}

# Copy startup script
COPY entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/entrypoint.sh

ENTRYPOINT ["entrypoint.sh"]
CMD ["tor", "-f", "/var/lib/tor/torrc"]
