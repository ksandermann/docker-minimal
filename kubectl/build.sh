#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

BLDER_VERSION="2020-06-19"

#starting 01.01.2019
declare -a releaseversions=(
#"v1.13.2"
#"v1.14.0-alpha.1"
#"v1.12.5"
#"v1.11.7"
#"v1.14.0-alpha.2"
#"v1.13.3"
#"v1.14.0-alpha.3"
#"v1.10.13"
#"v1.12.6"
#"v1.14.0-beta.1"
#"v1.11.8"
#"v1.13.4"
#"v1.14.0-beta.2"
#"v1.14.0-rc.1"
#"v1.11.9"
#"v1.12.7"
#"v1.13.5"
#"v1.14.0"
#"v1.14.1"
#"v1.15.0-alpha.1"
#"v1.12.8"
#"v1.15.0-alpha.2"
#"v1.11.10"
#"v1.15.0-alpha.3"
#"v1.13.6"
#"v1.14.2"
#"v1.12.9"
#"v1.15.0-beta.1"
#"v1.13.7"
#"v1.14.3"
#"v1.15.0-beta.2"
#"v1.15.0-rc.1"
#"v1.15.0"
#"v1.12.10"
#"v1.13.8"
#"v1.14.4"
#"v1.16.0-alpha.1"
#"v1.15.1"
#"v1.15.2"
#"v1.15.3"
#"v1.15.4"
#"v1.15.5"
#"v1.16.0"
#"v1.16.1"
"v1.14.5"
"v1.14.6"
"v1.14.7"
"v1.14.8"
"v1.14.9"
"v1.14.10"
"v1.15.6"
"v1.15.7"
"v1.15.8"
"v1.15.9"
"v1.15.10"
"v1.15.11"
"v1.15.12"
"v1.16.2"
"v1.16.3"
"v1.16.4"
"v1.16.5"
"v1.16.6"
"v1.16.7"
"v1.16.8"
"v1.16.9"
"v1.16.10"
"v1.16.11"
"v1.17.0"
"v1.17.1"
"v1.17.2"
"v1.17.3"
"v1.17.4"
"v1.17.5"
"v1.17.6"
"v1.17.7"
"v1.18.0"
"v1.18.1"
"v1.18.2"
"v1.18.3"
"v1.18.4"
)

for releaseversion in "${releaseversions[@]}";
do
    KCTL_VERSION=$releaseversion
    docker build \
        --build-arg BUILDER_VERSION=$BLDER_VERSION \
        --build-arg KUBECTL_VERSION=$KCTL_VERSION \
        -t ksandermann/kubectl:$KCTL_VERSION \
        .
    docker push ksandermann/kubectl:$KCTL_VERSION
    echo "sleeping 5 sec to ensure dockerhub image tags are sorted properly..."
    sleep 5
done
