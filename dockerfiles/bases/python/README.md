# oci-ml-python

Images published as `ghcr.io/nekomeowww/oci-ml-python`. This layer provides the
Pixi-managed Python toolchain that the rest of the stack depends on.

## Tags

| Tag | Dockerfile | Notes |
| --- | --- | --- |
| `3.13` | `./3.13/Dockerfile` | CPython 3.13 runtime with locked Pixi environment |

## Build locally

```bash
docker buildx build . \
  -f dockerfiles/bases/python/3.13/Dockerfile \
  --load -t ghcr.io/nekomeowww/oci-ml-python:3.13
```
