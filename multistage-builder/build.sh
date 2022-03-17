#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

LPINE_VERSION="3.14.4"
IMAGE_TAG="2022-03-17"

docker build \
    --build-arg ALPINE_VERSION=$LPINE_VERSION \
    -t ksandermann/multistage-builder:$IMAGE_TAG \
    .

docker login

docker push ksandermann/multistage-builder:$IMAGE_TAG

docker tag ksandermann/multistage-builder:$IMAGE_TAG ksandermann/multistage-builder:latest
docker push ksandermann/multistage-builder:latest
