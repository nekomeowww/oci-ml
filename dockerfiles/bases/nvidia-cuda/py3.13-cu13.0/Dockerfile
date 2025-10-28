FROM ghcr.io/nekomeowww/oci-images-machine-learning-python-3.13:0.0.1 AS build

WORKDIR /app

COPY ./dockerfiles/bases/nvidia-cuda/py3.13-cu13.0/pixi.toml .
COPY ./dockerfiles/bases/nvidia-cuda/py3.13-cu13.0/pixi.lock .

RUN --mount=type=cache,target=/root/.cache/rattler/cache,sharing=private pixi install
RUN printf '#!/bin/sh\n%s\nexec "$@"' "$(pixi shell-hook)" > /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
