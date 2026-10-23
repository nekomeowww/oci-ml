FROM ghcr.io/nekomeowww/oci-ml-pytorch:py3.13-cu13.0-2.9.0 AS build

# The published PyTorch base predates lockfile v7 support.
COPY --from=ghcr.io/prefix-dev/pixi:0.73.0 /usr/local/bin/pixi /usr/local/bin/pixi

# Pixi uses the system trust store for HTTPS downloads.
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./dockerfiles/clis/llamafactory/0.9.5/pixi.toml .
COPY ./dockerfiles/clis/llamafactory/0.9.5/pixi.lock .

RUN --mount=type=cache,target=/root/.cache/rattler/cache,sharing=private pixi install --locked
RUN printf '#!/bin/bash\n%s\nexec "$@"' "$(pixi shell-hook)" > /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Put the environment on PATH as well, so a Kubernetes `command` that replaces
# the entrypoint (for example `llamafactory-cli train config.yaml`) still finds
# Python, the CLI, and the `gcc` that Triton needs at runtime.
ENV PATH=/app/.pixi/envs/default/bin:$PATH

ENTRYPOINT ["/entrypoint.sh"]
CMD ["llamafactory-cli", "help"]
