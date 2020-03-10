FROM debian:buster-slim

ARG INSTALLING_DEPS=curl\ gnupg\ gnupg2
ARG DEPS=build-essential\ libssl-dev\ libxml2-dev\ libyaml-dev\ libgmp-dev\ libreadline-dev\ libz-dev

RUN apt-get update && \
    apt-get install $INSTALLING_DEPS -y && \
    curl -sSL https://dist.crystal-lang.org/apt/setup.sh | bash && \
    apt-get install crystal $DEPS  -y && \
    apt-get purge $INSTALLING_DEPS -y && \
    apt-get autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/lib/apt/lists/partial/*

CMD ["crystal"]
