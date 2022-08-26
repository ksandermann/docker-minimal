#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


BLDER_VERSION="2022-08-25"

#starting 2018-08-26
declare -a releaseversions=(
#"v2.9.0"
#"v2.9.1"
#"v2.10.0-rc.1"
#"v2.10.0-rc.2"
#"v2.10.0-rc.3"
#"v2.10.0"
#"v2.11.0-rc.1"
#"v2.11.0-rc.2"
#"v2.11.0-rc.3"
#"v2.11.0-rc.4"
#"v2.11.0"
#"v2.12.0-rc.1"
#"v2.12.0-rc.2"
#"v2.12.0"
#"v2.12.1"
#"v2.12.2"
#"v2.12.3"
#"v2.13.0-rc.1"
#"v2.13.0-rc.2"
#"v2.13.0"
#"v2.13.1"
#"v2.14.0-rc.1"
#"v2.14.0-rc.2"
#"v2.14.1"
#"v2.14.2"
#"v2.14.3"
#"v2.15.0"
#"v2.15.1"
#"v2.15.2"
#"v2.16.0-rc.1"
#"v2.16.0-rc.2"
#"v2.16.0"
#"v2.16.1"
#"v2.16.2"
#"v2.16.3"
#"v2.16.4"
#"v2.16.5"
#"v2.16.6"
#"v3.0.0"
#"v3.0.1"
#"v3.0.2"
#"v3.1.3"
#"v3.1.1"
#"v3.1.2"
#"v3.1.3"
#"v3.2.0"
#"v2.16.7"
#"v3.2.1"
#"v3.2.2"
#"v3.2.3"
#"v2.16.8"
#"v3.2.4"
"v2.16.9"
"v3.9.4"
)

for releaseversion in "${releaseversions[@]}";
do
    HLM_VERSION=$releaseversion
    docker buildx build \
        --pull \
        --platform linux/amd64,linux/arm64 \
        --build-arg BUILDER_VERSION=$BLDER_VERSION \
        --build-arg HELM_VERSION=$HLM_VERSION \
        -t ksandermann/helm:$HLM_VERSION \
        --push \
        .
    echo "sleeping 5 sec to ensure dockerhub image tags are sorted properly..."
    sleep 5
done
