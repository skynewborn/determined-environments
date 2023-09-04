#!/bin/sh
set -e
set -x

make build-gpu-cuda-113-base
make build-gpu-cuda-117-base
make build-gpu-cuda-118-base
make build-gpu-cuda-120-base
make build-pt110-gpu
make build-pt113-gpu
make build-pt20-gpu
