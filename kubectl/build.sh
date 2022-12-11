#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

BLDER_VERSION="latest"

source ./../scripts/functions.sh

RETURNEDLIST=$(github_get_releases "kubernetes/kubernetes")
rm -rf ./tmp.txt

for version in $RETURNEDLIST
do
  if [[ "${version}" != *"rc"* && "${version}" != *"b"* && "${version}" != *"a"* ]];
    then
      if docker_check_if_tag_exists "ksandermann/kubectl" "$version"; then
          echo docker tag ksandermann/kubectl:$version exist - skipping
      else
          echo docker tag ksandermann/kubectl:$version does not exist - building
          docker_build_kubectl $BLDER_VERSION "v$version" $version
      fi
  fi
done
