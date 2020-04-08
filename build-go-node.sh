#!/bin/bash

# Default we use latest go-lang version
GO_VER=${GO_VER:-"13"}
ALPINE_IMAGE=${ALPINE_IMAGE:-"blcksync/alpine-node:310"}

# alpine-node is shared which includes npm. It should be agnostic
# to go-lang version.

if [ -d go${GO_VER} ] ; then
  echo "ok - building Go 1.$GO_VER.x"
  docker build \
    --rm \
    -t blcksync/go-node:${GO_VER} \
    --build-arg ALPINE_IMAGE="$ALPINE_IMAGE" \
    --file go${GO_VER}/Dockerfile.go-node \
    .
  exit $?
else
  echo "fail - go version $GO_VER dir and Dockerfile missing or not supported!"
  exit -1
fi
