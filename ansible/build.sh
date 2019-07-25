#!/bin/bash
set -euo pipefail
IFS=$'\n\t'


BLDER_VERSION="2019-07-25"

#from pip3
declare -a releaseversions=(
"2.6.0"
"2.6.1"
"2.6.2"
"2.6.3"
"2.6.4"
"2.6.5"
"2.6.6"
"2.6.7"
"2.6.8"
"2.6.9"
"2.6.10"
"2.6.11"
"2.6.12"
"2.6.13"
"2.6.14"
"2.6.15"
"2.6.16"
"2.6.17"
"2.6.18"
"2.7.0"
"2.7.1"
"2.7.2"
"2.7.3"
"2.7.4"
"2.7.5"
"2.7.6"
"2.7.7"
"2.7.8"
"2.7.9"
"2.7.10"
"2.7.11"
"2.7.12"
"2.8.1"
"2.8.2"
)

for releaseversion in "${releaseversions[@]}";
do
   ANSBLE_VERSION=$releaseversion
   docker build \
       --pull \
       -t ksandermann/ansible:$ANSBLE_VERSION \
       .
   docker push ksandermann/ansible:$ANSBLE_VERSION
done