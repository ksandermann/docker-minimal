#!/usr/local/bin/bash
set -euo pipefail
IFS=$'\n\t'

#bash > 4.0 required
#https://stackoverflow.com/questions/10574969/how-do-i-install-bash-3-2-25-on-mac-os-x-10-5-8

BLDER_VERSION="2022-08-25"

#starting 2018-01-01
declare -A releaseversions=(
"4.10.23"
"4.11.0"

)

for releaseversion in "${releaseversions[@]}";
do
    OC_VERSION=$releaseversion
    docker build \
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
