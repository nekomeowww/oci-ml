FROM ghcr.io/nekomeowww/oci-ml-pytorch:py3.13-cu13.0-2.9.0 AS build

# The published PyTorch base predates lockfile v7 support.
COPY --from=ghcr.io/prefix-dev/pixi:0.73.0 /usr/local/bin/pixi /usr/local/bin/pixi

# Pixi uses the system trust store for HTTPS downloads.
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./dockerfiles/bases/onnxruntime/py3.13-cu13.0-torch2.9.0-1.27.0/pixi.toml .
COPY ./dockerfiles/bases/onnxruntime/py3.13-cu13.0-torch2.9.0-1.27.0/pixi.lock .

RUN --mount=type=cache,target=/root/.cache/rattler/cache,sharing=private pixi install --locked
