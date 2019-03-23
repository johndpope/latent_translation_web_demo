#!/bin/bash

set -e

source ./00-env-00-common.sh
source ./00-env-01-docker-build.sh

set -x 
docker run -it --rm \
    $DOCKER_ARGS \
    -p 8888:8888 \
    "${TAG}" \
    bash -c "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/work --ip 0.0.0.0 --no-browser --allow-root"
