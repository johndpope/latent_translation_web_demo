FROM docker:17.12.0-ce as static-docker-source
FROM tensorflow/tensorflow:1.13.1-gpu-py3-jupyter

#-------------------------------------------------------------------------------
### Install packages:
### - Line 1: locales for UTF-8, git for cloning github repo.
### - Line 2: Native dependency required by music vae.
#-------------------------------------------------------------------------------
RUN apt-get update -y -qq && \
    apt-get install -y -qq \
        locales git \
        libfluidsynth1 fluid-soundfont-gm build-essential libasound2-dev libjack-dev \
        && \
    rm -rf /var/lib/apt/lists/* /var/cache/apt/archives/*

#-------------------------------------------------------------------------------
### Enable UTF8 in docker instance
#-------------------------------------------------------------------------------
RUN locale-gen en_US.UTF-8
ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'

#-------------------------------------------------------------------------------
### Install python packages through pip
#-------------------------------------------------------------------------------
RUN pip install -qU svgwrite
RUN pip install -qU pyfluidsynth

# magenta requires >= 3.6.1 but tensorflow-metadata (required by magenta) requires >= 3.7
# Upgrade first before install magenta
RUN pip install -qU protobuf

# Some package pulled by `python setup.up` below may want to access `/.cache` for caching in docker, 
# which is bad if docker instance is running as a non-root user.
# So we install them from pip as a known good alternative.
RUN pip install  -U resampy pretty_midi


# pip version of Magenta may be out-dated. Instead, use the github version.
# For reproducibility, we pick commit 2cbc969 as of Mar 13, 2019.
# `--gpu` is required so dist tools wound't pull tensorflow (the non-gpu version).
RUN cd /opt && \
    git clone https://github.com/tensorflow/magenta && \
    cd magenta && \
    git checkout 2cbc969 && \
    python setup.py develop --gpu
    
# Overrides the default values from https://github.com/tensorflow/tensorflow/blob/master/tensorflow/tools/dockerfiles/partials/jupyter.partial.Dockerfile
WORKDIR /
CMD ["bash", "-c", "source /etc/bash.bashrc && jupyter notebook --notebook-dir=/ --ip 0.0.0.0 --no-browser --allow-root"]
