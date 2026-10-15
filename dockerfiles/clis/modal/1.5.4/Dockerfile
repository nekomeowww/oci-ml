FROM ghcr.io/nekomeowww/oci-ml-python:3.13 AS build

# The published Python base predates lockfile v7 support.
COPY --from=ghcr.io/prefix-dev/pixi:0.73.0 /usr/local/bin/pixi /usr/local/bin/pixi

# Pixi uses the system trust store for HTTPS downloads.
RUN apt-get update \
    && apt-get install -y --no-install-recommends ca-certificates \
    && update-ca-certificates \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

COPY ./dockerfiles/clis/modal/1.5.4/pixi.toml .
COPY ./dockerfiles/clis/modal/1.5.4/pixi.lock .

RUN --mount=type=cache,target=/root/.cache/rattler/cache,sharing=private pixi install --locked
RUN printf '#!/bin/bash\n%s\nexec "$@"' "$(pixi shell-hook)" > /entrypoint.sh
RUN chmod +x /entrypoint.sh

# Put the environment on PATH as well, so a Kubernetes `command` that replaces
# the entrypoint (for example `python script.py`) still finds Python and modal.
ENV PATH=/app/.pixi/envs/default/bin:$PATH

ENTRYPOINT ["/entrypoint.sh"]
CMD ["modal", "--help"]
