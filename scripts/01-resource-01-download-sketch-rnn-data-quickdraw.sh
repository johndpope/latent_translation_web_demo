#!/bin/bash

set -e

source ./00-env-00-common.sh

dir_output=$DIR_RESOURCES/sketch-rnn-data-quickdraw
mkdir -p "$dir_output"
gsutil -m cp -R gs://quickdraw_dataset/sketchrnn/ "$dir_output"
