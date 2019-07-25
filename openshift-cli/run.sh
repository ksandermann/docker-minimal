#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

OC_CLI_VERSION="v3.11.0"

docker run -ti --rm \
    -v ~/.kube:/root/.kube \
    ksandermann/openshift-cli:$OC_CLI_VERSION \
    bash