#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

ANSBLE_VERSION="6.3.10"

docker run -ti --rm \
    -v ~/.ssh:/root/.ssh \
    -v ${PWD}:/root/project \
    ksandermann/ansible:$ANSBLE_VERSION \
    bash
