#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

BLDER_VERSION="2020-06-19"

#starting 01.01.2019
declare -a releaseversions=(
#"v1.13.2"

"v1.18.4"
)

for releaseversion in "${releaseversions[@]}";
do
    NSENTER_VERSION=$releaseversion
    docker build \
        --build-arg BUILDER_VERSION=$BLDER_VERSION \
        --build-arg KUBECTL_VERSION=$KCTL_VERSION \
        -t ksandermann/kubectl:$KCTL_VERSION \
        .
    docker push ksandermann/kubectl:$KCTL_VERSION
    echo "sleeping 5 sec to ensure dockerhub image tags are sorted properly..."
    sleep 5
done
