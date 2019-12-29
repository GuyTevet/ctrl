#!/usr/bin/env bash

MODEL_NAME=seqlen256_v1.ckpt
MODEL_DIR="./models/${MODEL_NAME}"
URLS=(
https://storage.googleapis.com/sf-ctrl/seqlen256_v1.ckpt/checkpoint
https://storage.googleapis.com/sf-ctrl/seqlen256_v1.ckpt/model.ckpt-413000.data-00000-of-00001
https://storage.googleapis.com/sf-ctrl/seqlen256_v1.ckpt/model.ckpt-413000.index
https://storage.googleapis.com/sf-ctrl/seqlen256_v1.ckpt/model.ckpt-413000.meta
)

# get data
if [ ! -d $MODEL_DIR ]; then
    mkdir models
    mkdir $MODEL_DIR
    for url in "${URLS[@]}"; do
        name=${url##*/}
        curl -o "${MODEL_DIR}/${name}" $url
    done
fi