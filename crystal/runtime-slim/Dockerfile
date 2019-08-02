FROM debian:buster-slim


RUN apt update && \
    apt install libyaml-0-2 libssl1.1 libevent-2.1-6 ca-certificates -y && \
    rm -rf /var/lib/apt/lists/*  && \
    rm -rf /var/lib/apt/lists/partial/*


CMD ["bash"]
