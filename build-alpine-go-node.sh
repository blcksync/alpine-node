#!/bin/bash

GO_VER=${GO_VER:-"11"}
IMG_LABEL_TAG="blcksync/alpine-node"
ALPINE_VER=${ALPINE_VER:-"39"}

echo "ok - building our own customized image "
# Build base blcksync/alpine-node:latest image
docker build \
  --rm \
  -t $IMG_LABEL_TAG \
  --file Dockerfile.alpine${ALPINE_VER}-node \
  .

ret=$?

if [ "$ret" != "0" ] ; then
  echo "fail - $IMG_LABEL_TAG build failed"
  exit $ret
fi

GO_VER=$GO_VER ./build-go-node.sh
