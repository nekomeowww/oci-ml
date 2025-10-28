# oci-ml-nvidia-cuda

Images published as `ghcr.io/nekomeowww/oci-ml-nvidia-cuda`. These extend
`oci-ml-python` with NVIDIA CUDA toolkits for GPU workloads.

## Tags

| Tag | Dockerfile | Notes |
| --- | --- | --- |
| `py3.13-13.0` | `./py3.13-cu13.0/Dockerfile` | CUDA 13.0 stack layered on top of Python 3.13 base |

## Build locally

```bash
docker buildx build . \
  -f dockerfiles/bases/nvidia-cuda/py3.13-cu13.0/Dockerfile \
  --load -t ghcr.io/nekomeowww/oci-ml-nvidia-cuda:py3.13-13.0
```
