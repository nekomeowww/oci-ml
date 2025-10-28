FROM ghcr.io/nekomeowww/oci-images-machine-learning-nvidia-cuda-py3.13-cu13.0:0.0.1 AS build

WORKDIR /app

COPY ./dockerfiles/bases/torch/py3.13-cu13.0-2.9.0/pixi.toml .
COPY ./dockerfiles/bases/torch/py3.13-cu13.0-2.9.0/pixi.lock .

RUN --mount=type=cache,target=/root/.cache/rattler/cache,sharing=private pixi install
