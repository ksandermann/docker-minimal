#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

docker_build_helm() {
  docker buildx build \
      --pull \
      --platform linux/amd64,linux/arm64 \
      --build-arg BUILDER_VERSION=$1 \
      --build-arg HELM_VERSION=$2 \
      -t ksandermann/helm:$3 \
      --push \
      .
  echo "sleeping 5 sec to ensure dockerhub image tags are sorted properly..."
  sleep 5
}

docker_build_kubectl() {
  docker buildx build \
      --pull \
      --platform linux/amd64,linux/arm64 \
      --build-arg BUILDER_VERSION=$1 \
      --build-arg KUBECTL_VERSION=$2 \
      -t ksandermann/kubectl:$3 \
      --push \
      .
  echo "sleeping 5 sec to ensure dockerhub image tags are sorted properly..."
  sleep 5
}


github_get_releases() {
  curl --silent "https://api.github.com/repos/$1/releases" | jq -r '.[].tag_name ' | sed 's/v//g' > ./tmp.txt
  sed '1!G;h;$!d' tmp.txt
}

docker_check_if_tag_exists() {
    curl --silent -f --head -lL https://hub.docker.com/v2/repositories/$1/tags/$2 > /dev/null
}
