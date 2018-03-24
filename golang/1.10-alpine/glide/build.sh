#!/usr/bin/env sh

glide install && cd "$GOPATH/src/targetProject" && go build -o bin