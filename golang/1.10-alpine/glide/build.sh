#!/usr/bin/env sh

glide install && cd "$GOPATH/src/targetProject" && go build -ldflags "-s -w" -o bin