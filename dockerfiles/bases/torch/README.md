# oci-ml-pytorch

Images published as `ghcr.io/nekomeowww/oci-ml-pytorch`. They add the PyTorch
stack on top of the CUDA-enabled base image.

## Tags

| Tag | Dockerfile | Notes |
| --- | --- | --- |
| `py3.13-cu13.0-2.10.0` | `./py3.13-cu13.0-2.10.0/Dockerfile` | PyTorch 2.10.0 with CUDA 13.0 support built on Python 3.13; `gcc` works for Triton |
| `py3.13-cu13.0-2.9.0` | `./py3.13-cu13.0-2.9.0/Dockerfile` | PyTorch 2.9.0 with CUDA 13.0 support built on Python 3.13 |

Prefer `py3.13-cu13.0-2.10.0`. The `2.9.0` image has two known problems:

- PyTorch 2.9 has a 3D convolution regression with AMP
  ([pytorch/pytorch#166122](https://github.com/pytorch/pytorch/issues/166122), fixed
  in 2.10.0). LLaMA-Factory refuses to train models with a `Conv3d` on 2.9.x.
- Its `c-compiler` resolved to 1.0.0, whose `bin/gcc` points to a compiler that is
  not installed, so Triton cannot compile kernels.

The `2.10.0` lock started from the `2.9.0` lock, so the conda CUDA 13.0 packages
are the same builds as the CUDA base. Start from the previous lock when you add a
new PyTorch version: a fresh resolve picks newer CUDA 13.x packages.

## Build locally

```bash
docker buildx build --platform linux/amd64 . \
  -f dockerfiles/bases/torch/py3.13-cu13.0-2.10.0/Dockerfile \
  --load -t ghcr.io/nekomeowww/oci-ml-pytorch:py3.13-cu13.0-2.10.0
```
