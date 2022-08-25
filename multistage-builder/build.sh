#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

LPINE_VERSION="3.16.2"
IMAGE_TAG="2022-08-25"

docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --build-arg ALPINE_VERSION=$LPINE_VERSION \
    --push \
    -t ksandermann/multistage-builder:$IMAGE_TAG \
    -t ksandermann/multistage-builder:latest \
    .

#docker login
#
#docker push ksandermann/multistage-builder:$IMAGE_TAG
#
#docker tag ksandermann/multistage-builder:$IMAGE_TAG ksandermann/multistage-builder:latest
#docker push ksandermann/multistage-builder:latest
