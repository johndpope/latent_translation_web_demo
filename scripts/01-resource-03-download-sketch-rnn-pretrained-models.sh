#!/bin/bash

set -e

source ./00-env-00-common.sh

dir_output=$DIR_RESOURCES/sketch-rnn-pretrained-models
mkdir -p "$dir_output"

# URLS are here: https://github.com/tensorflow/magenta/blob/master/magenta/models/sketch_rnn/sketch_rnn_train.py#L56
wget -nc -P "$dir_output" http://download.magenta.tensorflow.org/models/sketch_rnn.zip

( cd $dir_output ; unzip sketch_rnn.zip ; )
