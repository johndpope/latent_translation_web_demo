#!/bin/bash

set -e

source ./00-env-00-common.sh

docker build -t "${TAG}" ./00-env-01-docker-build/
