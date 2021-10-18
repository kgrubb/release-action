FROM debian:stable-slim

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && apt-get install -y --no-install-recommends xmlstarlet curl git devscripts \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

# create and use an elementary user instead of root
RUN groupadd -r elementary && useradd --no-log-init -r -g elementary elementary

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
