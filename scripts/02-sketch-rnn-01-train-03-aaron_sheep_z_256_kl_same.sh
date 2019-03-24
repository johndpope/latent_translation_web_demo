#!/bin/bash

set -e

source ./00-env-00-common.sh
source ./00-env-01-docker-build.sh
source ./01-resource-02-download-sketch-rnn-data-simple.sh

HPARAMS="data_set=[aaron_sheep.npz],enc_model=layer_norm,dec_model=layer_norm,augment_stroke_prob=0.15,z_size=256,kl_weight=0.5,kl_weight_start=0.01,kl_tolerance=0.2"
LOG_PLACE="aaron_sheep/layer_norm/z_256_kl_same"  


docker run -it --rm \
    $DOCKER_ARGS \
    -w /opt/magenta \
    "${TAG}" \
    python \
        magenta/models/sketch_rnn/sketch_rnn_train.py \
        --log_root /work/scratch/sketch-rnn/$LOG_PLACE \
        --data_dir /work/resources/sketch-rnn-data-simple/ \
        --hparams=$HPARAMS \
