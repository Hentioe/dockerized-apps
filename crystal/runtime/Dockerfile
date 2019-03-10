FROM ubuntu:xenial


RUN apt update && \
    apt install libssl-dev libevent-dev -y && \
    rm -rf /var/lib/apt/lists/*  && \
    rm -rf /var/lib/apt/lists/partial/*


CMD ["bash"]