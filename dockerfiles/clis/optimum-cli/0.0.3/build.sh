#!/usr/bin/env bash

docker buildx build --platform linux/amd64 . -f dockerfiles/bases/python/3.13/Dockerfile --load -t ghcr.io/nekomeowww/oci-ml-python:3.13
docker buildx build --platform linux/amd64 . -f dockerfiles/bases/nvidia-cuda/py3.13-cu13.0/Dockerfile --load -t ghcr.io/nekomeowww/oci-ml-nvidia-cuda:py3.13-13.0
docker buildx build --platform linux/amd64 . -f dockerfiles/bases/torch/py3.13-cu13.0-2.9.0/Dockerfile --load -t ghcr.io/nekomeowww/oci-ml-pytorch:py3.13-cu13.0-2.9.0
docker buildx build --platform linux/amd64 . -f dockerfiles/bases/onnxruntime/py3.13-cu13.0-torch2.9.0-1.27.0/Dockerfile --load -t ghcr.io/nekomeowww/oci-ml-onnxruntime:py3.13-cu13.0-torch2.9.0-1.27.0
docker buildx build --platform linux/amd64 . -f dockerfiles/clis/optimum-cli/0.0.3/Dockerfile --load -t ghcr.io/nekomeowww/oci-ml-optimum-cli:0.0.3
