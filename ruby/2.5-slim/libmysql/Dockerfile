FROM bluerain/ruby-2.5-slim:build-essential


RUN apt update \
    && apt install -y --no-install-recommends default-libmysqlclient-dev mysql-common \
    && rm -rf /var/lib/apt/lists/*


CMD ["irb"]