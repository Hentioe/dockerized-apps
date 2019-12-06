FROM debian:buster-slim

ARG DEPS=libyaml-0-2\ libssl1.1\ libevent-2.1-6\ ca-certificates\ mime-support

RUN apt-get update && \
    apt-get install $DEPS -y && \
    rm -rf /var/lib/apt/lists/*  && \
    rm -rf /var/lib/apt/lists/partial/*

CMD ["bash"]
