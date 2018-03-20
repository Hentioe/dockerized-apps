FROM golang:1.10-alpine3.7


RUN apk update && apk add --no-cache ca-certificates git && \
    go get -u github.com/Masterminds/glide


CMD glide -v