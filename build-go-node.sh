#!/bin/bash

# Default we use latest go-lang version
GO_VER=${GO_VER:-"13"}
ALPINE_IMAGE=${ALPINE_IMAGE:-"blcksync/alpine-node:310"}

# alpine-node is shared which includes npm. It should be agnostic
# to go-lang version.

if [ "$GO_VER" = "10" ] ; then
  echo "ok - building Go 1.10.x"
  docker build \
    --rm \
    -t blcksync/go-nodee:${GO_VER} \
    --build-arg ALPINE_IMAGE="$ALPINE_IMAGE" \
    --file Dockerfile.go${GO_VER}-node \
    .
elif [ "$GO_VER" = "11" ] ; then
  echo "ok - building Go 1.11.x"
  docker build \
    --rm \
    -t blcksync/go-node:${GO_VER} \
    --build-arg ALPINE_IMAGE="$ALPINE_IMAGE" \
    --file Dockerfile.go${GO_VER}-node \
    .
elif [ "$GO_VER" = "13" ] ; then
  echo "ok - building Go 1.13.x"
  docker build \
    --rm \
    -t blcksync/go-node:${GO_VER} \
    --build-arg ALPINE_IMAGE="$ALPINE_IMAGE" \
    --file Dockerfile.go${GO_VER}-node \
    .
fi
