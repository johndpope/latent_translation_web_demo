#!/bin/bash

# Other scripts should source this file for common variables / routines / tasks
# it is also a good place to use set builtin <https://www.gnu.org/software/bash/manual/html_node/The-Set-Builtin.html>
# so that these sets would have global effect.

set -u  # Treat unset variables and parameters other than the special parameters ‘@’ or ‘*’ as an error

# docker tag
TAG='local:000-latent_translation_web_demo'

# paths
DIR_RESOURCES=$(realpath "../resources")
mkdir -p $DIR_RESOURCES

DIR_SCRATCH=$(realpath "../scratch")
mkdir -p $DIR_SCRATCH

DIR_NOTEBOOKS=$(realpath "../notebooks")
mkdir -p $DIR_NOTEBOOKS

# docker args, including runtime, [ug]id, mounting, etc.
DOCKER_ARGS="--runtime=nvidia
    -u $(id -u):$(id -g) 
    -v $DIR_SCRATCH:/work/scratch -v $DIR_RESOURCES:/work/resources -v $DIR_NOTEBOOKS:/work/notebooks
    -w "/"
"

# - How GPUs are selected: https://github.com/NVIDIA/nvidia-docker/wiki/Usage
set +u  # temporarily raise the constraint
if [ ! -z ${NVIDIA_VISIBLE_DEVICES+x} ]; then DOCKER_ARGS="$DOCKER_ARGS -e NVIDIA_VISIBLE_DEVICES=$NVIDIA_VISIBLE_DEVICES " ; fi
set -u

