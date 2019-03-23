#!/bin/bash

set -e

source ./00-env-00-common.sh
source ./00-env-01-docker-build.sh

docker run -it --rm \
    --runtime=nvidia \
    -u $(id -u):$(id -g) \
    "${TAG}" \
    /bin/bash
