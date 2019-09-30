# Base docker image
FROM debian:buster-slim

LABEL maintainer="roshii <roshii@riseup.net>"

# Install OS utilities
RUN set -ex \
	&& apt-get update \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	apt-utils --no-install-recommends \
	&& DEBIAN_FRONTEND=noninteractive apt-get upgrade -y

RUN set -ex \
	&& DEBIAN_FRONTEND=noninteractive apt-get install -y \
	gosu tor tor-geoipdb obfs4proxy --no-install-recommends \
	&& rm -rf /var/lib/apt/lists/* \
	&& rm /etc/tor/torrc

USER debian-tor

ENTRYPOINT ["tor" "-f" "/var/lib/tor/torrc"]
