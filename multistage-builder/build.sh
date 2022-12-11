#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

LPINE_VERSION="latest"
IMAGE_TAG=$(date --rfc-3339=date)

docker buildx build \
    --platform linux/amd64,linux/arm64 \
    --build-arg ALPINE_VERSION=$LPINE_VERSION \
    --push \
    -t ksandermann/multistage-builder:$IMAGE_TAG \
    -t ksandermann/multistage-builder:latest \
    .
