#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

HLM_VERSION="v2.14.2"
TLLER_NAMESPACE="kubetools"

docker run -ti --rm \
    -v ~/.kube:/root/.kube \
    -v ~/.helm:/root/.helm \
    ksandermann/helm:$HLM_VERSION \
    -e TILLER_NAMESPACE=$TLLER_NAMESPACE \
    bash