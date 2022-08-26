#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

BLDER_VERSION="2022-08-25"

#starting 2018-01-01
declare -a releaseversions=(
"4.11.0"
)

for releaseversion in "${releaseversions[@]}";
do
    OC_VERSION=$releaseversion
    docker buildx build \
        --pull \
        --build-arg BUILDER_VERSION=$BLDER_VERSION \
        --build-arg OC_CLI_VERSION=$OC_VERSION \
        --platform linux/amd64,linux/arm64 \
        -t ksandermann/openshift-cli:$OC_VERSION \
        --push \
        .
    echo "sleeping 5 sec to ensure dockerhub image tags are sorted properly..."
    sleep 5
done
