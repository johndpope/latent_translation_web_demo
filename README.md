# Latent Translation Web Demo

A possible web-based demo of the latent translation paper.

## Overview

As a first step towards a web-based demo, 
we need a proof of concept to transfer between sketch-rnn and music-vae (first without classification).
This proof of concept should be run offline, whose results would then be discussed to determine how to move on to the online demo.

## Research Agenda

Current state: train both sketch-rnn and music-vae. The reason not to use pre-trained model is that first the pre-trained models for two models are of different `z_size`, and music-vae's pre-trained models are trained using dataset that is only internally available while we need data to get the posterior `z` for both model.

### Train sketch-rnn

It seems that the default model is trained with `z_size=128`. Besides reproduce David's work on `aaron_sheep` dataset, we also play with the correct way to get model with `z_size=256` by tuning correctly the KL-related hyper-parameters.
The turning involves halfing and doubling the KL-related terms. Luckily, all KL-related terms in Sketch RNN code are for mean of all instances in a batch (see Eq. 10 in the paper).

## Technical Notes

### File organization

- `./scripts/`: For invoking commands. Note how scripts are organized.
- `./notebooks/`: Hacking on how to sample shits.
- `./resources`: Public available resources that could be downloaded.
- `./scratch`: Scratch directory for logging and saving checkpoints.

### Online resources

- Sketch-RNN
  - Code: <https://github.com/tensorflow/magenta/tree/master/magenta/models/sketch_rnn>
  - Jupyter notebook for inference: <https://github.com/tensorflow/magenta-demos/blob/master/jupyter-notebooks/Sketch_RNN.ipynb>
  - Dataset:
    - Three simple datasets: <https://github.com/hardmaru/sketch-rnn-datasets/tree/master/>
    - Complete QuickDarw Dataset
      - Actually here: <https://console.cloud.google.com/storage/browser/quickdraw_dataset/sketchrnn/>
      - How to download with `gsutil`: <https://stackoverflow.com/questions/39137053/how-to-download-multiple-files-in-google-cloud-storage>
- Music-VAE
  - Code: <https://github.com/tensorflow/magenta/tree/master/magenta/models/music_vae>
  - Colab notebook for inference: <https://colab.research.google.com/notebooks/magenta/music_vae/music_vae.ipynb>

### Technical decision

It seems that all these notebooks requires (1) magenta package, which is fine, and (2) some native dependency for ubuntu. Further more, if I want to hack how to sample, I can do it by writing new code rather than change magenta code, which means I don't need to compile magenta but just need to `pip install` it, which makes life easier.

Scripts leverage `nvidia-docker` for running GPU-based training. To specify a perticular GPU to run on, prefix the command with something like  `NVIDIA_VISIBLE_DEVICES=2`.

In the future, `./code/` may be introduced.

## Thoughts / Discussions logging

## March 18, Mon

Jesse: Music vae can be retrained with the lakh midi dataset (as stated ), but that's not what the original checkpoints are trained on (e.g. internal dataset).

## March 22, 2019

TensorFlow won't be happy if the path to a checkpoint contains special characters such as `=`. This should be noted

For Sketch RNN, using `z_size=256` with + old KL terms designed for `z_size=256` seems to be a bad thing. We need to turn the KL-related terms.

