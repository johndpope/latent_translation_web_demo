#!/bin/bash

set -e

source ./00-env-00-common.sh
source ./00-env-01-docker-build.sh

docker run -it --rm \
    $DOCKER_ARGS \
    -w /opt/magenta \
    -p 6006:6006 \
    "${TAG}" \
    tensorboard \
        --logdir /work/scratch/sketch-rnn/
