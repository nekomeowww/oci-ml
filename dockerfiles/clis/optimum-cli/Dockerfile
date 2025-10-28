FROM ghcr.io/prefix-dev/pixi:latest AS build

WORKDIR /app

COPY ./dockerfiles/clis/optimum-cli/pixi.toml .
COPY ./dockerfiles/clis/optimum-cli/pixi.lock .

RUN --mount=type=cache,target=/root/.cache/rattler/cache,sharing=private pixi install
RUN printf '#!/bin/sh\n%s\nexec "$@"' "$(pixi shell-hook)" > /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh", "optimum-cli"]
