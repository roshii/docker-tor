# Base docker image
FROM debian:buster-slim

LABEL maintainer="Simon Castano <simon@brane.cc>"

ENV DEBIAN_FRONTEND=noninteractive
ARG PT_PORT

# Install Tor binaries
RUN set -ex \
	&& apt update \
	&& apt install --no-install-recommends --no-install-suggests -y \
	apt-utils \
	&& apt install --no-install-recommends --no-install-suggests -y \
	gosu \
	tor \
	tor-geoipdb \
	obfs4proxy \
	&& apt purge --auto-remove -y \
	apt-utils \
	&& apt clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm /etc/tor/torrc

VOLUME ["/var/lib/tor"]

EXPOSE 9001 ${PT_PORT}

# Copy startup script
COPY entrypoint.sh /usr/local/bin/

ENTRYPOINT ["entrypoint.sh"]
CMD ["tor", "-f", "/var/lib/tor/torrc"]
