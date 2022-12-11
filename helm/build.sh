#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


BLDER_VERSION="latest"

source ./../scripts/functions.sh

RETURNEDLIST=$(github_get_releases "helm/helm")
rm -rf ./tmp.txt

for version in $RETURNEDLIST
do
  if [[ "${version}" != *"rc"* && "${version}" != *"b"* && "${version}" != *"a"* ]];
    then
      if docker_check_if_tag_exists "ksandermann/helm" "$version"; then
          echo docker tag ksandermann/helm:$version exist - skipping
      else
          echo docker tag ksandermann/helm:$version does not exist - building
          docker_build_helm $BLDER_VERSION "v$version" $version
      fi
  fi
done
