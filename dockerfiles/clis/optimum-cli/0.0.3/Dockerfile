FROM ghcr.io/nekomeowww/oci-images-machine-learning-onnxruntime-py3.13-cu13.0-torch2.9.0-1.23.2:0.0.1 AS build

WORKDIR /app

COPY ./dockerfiles/clis/optimum-cli/0.0.3/pixi.toml .
COPY ./dockerfiles/clis/optimum-cli/0.0.3/pixi.lock .

RUN --mount=type=cache,target=/root/.cache/rattler/cache,sharing=private pixi install
RUN printf '#!/bin/sh\n%s\nexec "$@"' "$(pixi shell-hook)" > /entrypoint.sh
RUN chmod +x /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh", "python"]
