#!/bin/bash

set -e

source ./00-env-00-common.sh

dir_output=$DIR_RESOURCES/sketch-rnn-data-simple
mkdir -p "$dir_output"

wget -nc -P "$dir_output" https://github.com/hardmaru/sketch-rnn-datasets/raw/master/aaron_sheep/aaron_sheep.npz
wget -nc -P "$dir_output" https://github.com/hardmaru/sketch-rnn-datasets/raw/master/omniglot/omniglot.npz
wget -nc -P "$dir_output" https://github.com/hardmaru/sketch-rnn-datasets/raw/master/kanji/kanji.rdp25.npz
wget -nc -P "$dir_output" https://github.com/hardmaru/sketch-rnn-datasets/raw/master/kanji/kanji.rdp100.npz
wget -nc -P "$dir_output" https://github.com/hardmaru/sketch-rnn-datasets/raw/master/kanji/kanji.rdp200.npz
wget -nc -P "$dir_output" https://github.com/hardmaru/sketch-rnn-datasets/raw/master/kanji/short_kanji.npz
