#!/usr/bin/env sh

dep ensure && cd "$GOPATH/src/targetProject" && go build -ldflags "-s -w" -o bin