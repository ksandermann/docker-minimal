#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

KCTL_VERSION="v1.25.0"

docker run -ti --rm \
    -v ~/.kube:/root/.kube \
    ksandermann/kubectl:$KCTL_VERSION \
    bash
