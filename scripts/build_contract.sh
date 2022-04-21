#!/bin/bash

# build cargo
cargo build

# compile and optimizer contract
sudo docker run --rm -v "$(pwd)":/contract \
        --mount type=volume,source="$(basename "$(pwd)")_cache",target=/code/target \
        --mount type=volume,source=registry_cache,target=/usr/local/cargo/registry \
        enigmampc/secret-contract-optimizer:1.0.6

# unpack the optimized contract.wasm
gunzip contract.wasm.gz