FROM ghcr.io/prefix-dev/pixi:latest AS build

WORKDIR /app

COPY ./dockerfiles/bases/python/3.13/pixi.toml .
COPY ./dockerfiles/bases/python/3.13/pixi.lock .

RUN --mount=type=cache,target=/root/.cache/rattler/cache,sharing=private pixi install
