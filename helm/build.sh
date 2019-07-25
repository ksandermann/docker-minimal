#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


BLDER_VERSION="2019-07-25"

#starting 2018-08-26
declare -a releaseversions=(
"v2.9.0"
"v2.9.1"
"v2.10.0-rc.1"
"v2.10.0-rc.2"
"v2.10.0-rc.3"
"v2.10.0"
"v2.11.0-rc.1"
"v2.11.0-rc.2"
"v2.11.0-rc.3"
"v2.11.0-rc.4"
"v2.11.0"
"v2.12.0-rc.1"
"v2.12.0-rc.2"
"v2.12.0"
"v2.12.1"
"v2.12.2"
"v2.12.3"
"v2.13.0-rc.1"
"v2.13.0-rc.2"
"v2.13.0"
"v2.13.1"
"v2.14.0-rc.1"
"v2.14.0-rc.2"
"v2.14.1"
"v2.14.2"
)

for releaseversion in "${releaseversions[@]}";
do
   HLM_VERSION=$releaseversion
   docker build \
       --pull \
       --build-arg BUILDER_VERSION=$BLDER_VERSION \
       --build-arg HELM_VERSION=$HLM_VERSION \
       -t ksandermann/helm:$HLM_VERSION \
       .
   docker push ksandermann/helm:$HLM_VERSION
done