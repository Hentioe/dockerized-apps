FROM ubuntu:xenial


RUN apt update && \
    apt install libssl-dev libevent-dev ca-certificates -y && \
    rm -rf /var/lib/apt/lists/*  && \
    rm -rf /var/lib/apt/lists/partial/*


CMD ["bash"]