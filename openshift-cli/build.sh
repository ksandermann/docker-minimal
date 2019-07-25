#!/usr/local/bin/bash
set -euo pipefail
IFS=$'\n\t'

#bash > 4.0 required
#https://stackoverflow.com/questions/10574969/how-do-i-install-bash-3-2-25-on-mac-os-x-10-5-8

BLDER_VERSION="2019-07-25"

#starting 2018-01-01
declare -A releaseversions=(
["v3.7.1"]="https://github.com/openshift/origin/releases/download/v3.7.1/openshift-origin-client-tools-v3.7.1-ab0f056-linux-64bit.tar.gz"
["v3.9.0-alpha.3"]="https://github.com/openshift/origin/releases/download/v3.9.0-alpha.3/openshift-origin-client-tools-v3.9.0-alpha.3-78ddc10-linux-64bit.tar.gz"
["v3.7.2"]="https://github.com/openshift/origin/releases/download/v3.7.2/openshift-origin-client-tools-v3.7.2-282e43f-linux-64bit.tar.gz"
["v3.9.0"]="https://github.com/openshift/origin/releases/download/v3.9.0/openshift-origin-client-tools-v3.9.0-191fece-linux-64bit.tar.gz"
["v3.10.0-rc.0"]="https://github.com/openshift/origin/releases/download/v3.10.0-rc.0/openshift-origin-client-tools-v3.10.0-rc.0-c20e215-linux-64bit.tar.gz"
["v3.10.0"]="https://github.com/openshift/origin/releases/download/v3.10.0/openshift-origin-client-tools-v3.10.0-dd10d17-linux-64bit.tar.gz"
["v3.11.0"]="https://github.com/openshift/origin/releases/download/v3.11.0/openshift-origin-client-tools-v3.11.0-0cbc58b-linux-64bit.tar.gz"

)

for releaseversion in "${!releaseversions[@]}";
do
   OC_VERSION=$releaseversion
   OC_CLI_SRCE=${releaseversions[$releaseversion]}

   docker build \
        --pull \
        --build-arg BUILDER_VERSION=$BLDER_VERSION \
        --build-arg OC_CLI_SOURCE=$OC_CLI_SRCE \
        -t ksandermann/openshift-cli:$OC_VERSION \
        .
   docker push ksandermann/openshift-cli:$OC_VERSION
done