#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

NSENTER_VERSION="v1.18.4"

docker run -ti --rm \
    ksandermann/nsenter:$NSENTER_VERSION \
    bash
