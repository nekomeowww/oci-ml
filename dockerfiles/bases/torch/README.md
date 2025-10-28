# oci-ml-pytorch

Images published as `ghcr.io/nekomeowww/oci-ml-pytorch`. They add the PyTorch
stack on top of the CUDA-enabled base image.

## Tags

| Tag | Dockerfile | Notes |
| --- | --- | --- |
| `py3.13-cu13.0-2.9.0` | `./py3.13-cu13.0-2.9.0/Dockerfile` | PyTorch 2.9.0 with CUDA 13.0 support built on Python 3.13 |

## Build locally

```bash
docker buildx build . \
  -f dockerfiles/bases/torch/py3.13-cu13.0-2.9.0/Dockerfile \
  --load -t ghcr.io/nekomeowww/oci-ml-pytorch:py3.13-cu13.0-2.9.0
```
