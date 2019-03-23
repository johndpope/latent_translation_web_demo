#!/bin/bash

set -e

source ./00-env-00-common.sh

LOCAL_ROOT="/home/tian/0-cs/000-latent_translation_web_demo"
REMOTE_HOST="box0.zt1"
REMOTE_ROOT="/home/tian/0-cs/000-latent_translation_web_demo"

ssh $REMOTE_HOST "mkdir -p $REMOTE_ROOT"

lsyncd -nodaemon --delay 1 \
    -rsync "$LOCAL_ROOT"/scripts $REMOTE_HOST:"$REMOTE_ROOT"/scripts
