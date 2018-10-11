FROM golang:1.11-alpine3.7


ARG GO_PATH=/GOPATH
ARG TARGET=$GO_PATH/src/targetProject
ARG CACHE_DIR=/home/cache
ARG CONFIG_DIR="$GO_PATH/pkg/dep"


COPY ./build.sh /usr/bin/build


RUN apk update \
    && apk add --no-cache ca-certificates git gcc musl-dev \
    && go get -u github.com/golang/dep/cmd/dep \
    && chmod +x /usr/bin/build \
    && mkdir -p "$GO_PATH/src" $TARGET $CACHE_DIR $CONFIG_DIR \
    && ln -s $CACHE_DIR "$CONFIG_DIR/sources"



WORKDIR $TARGET



ENV GOPATH=$GO_PATH


VOLUME $CACHE_DIR


CMD ["build"]