FROM ghcr.io/nekomeowww/oci-ml-python:3.13 AS build

WORKDIR /app

COPY ./dockerfiles/bases/nvidia-cuda/py3.13-cu13.0/pixi.toml .
COPY ./dockerfiles/bases/nvidia-cuda/py3.13-cu13.0/pixi.lock .

RUN --mount=type=cache,target=/root/.cache/rattler/cache,sharing=private pixi install
