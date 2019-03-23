#!/bin/bash

set -e

source ./00-env-00-common.sh

dir_output=$DIR_RESOURCES/music-vae-colab2-ckpts
mkdir -p "$dir_output"
gsutil -q -m cp -R gs://download.magenta.tensorflow.org/models/music_vae/colab2/* "$dir_output"                                                                                     


