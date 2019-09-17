#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

BLDER_VERSION="2019-07-25"

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
"v1.15.2"
"v1.15.3"
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
