FROM elixir:1.7.3-slim


RUN apt-get update \
    && apt-get install git -y\
    && rm -rf /var/lib/apt/lists/* \
    && rm -rf /var/lib/apt/lists/partial/*
RUN mix local.hex --force \
    && mix local.rebar --force


CMD ["iex"]