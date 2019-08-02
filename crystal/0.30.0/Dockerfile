FROM debian:buster-slim


RUN apt update && \
    apt install curl gnupg gnupg2 -y && \
    curl -sSL https://dist.crystal-lang.org/apt/setup.sh | bash && \
    apt install crystal \
                build-essential \
                libssl-dev \
                libxml2-dev \
                libyaml-dev \
                libgmp-dev \
                libreadline-dev \
                libz-dev -y && \
    apt purge curl gnupg gnupg2 -y && \
    apt autoremove -y && \
    rm -rf /var/lib/apt/lists/* && \
    rm -rf /var/lib/apt/lists/partial/*

CMD ["crystal"]
