# oci-ml-onnxruntime

Images published as `ghcr.io/nekomeowww/oci-ml-onnxruntime`. They extend the
PyTorch base with ONNX Runtime GPU builds for serving and optimization
workloads.

This GPU image targets Linux x86_64 (`linux/amd64`) only. It installs
`onnxruntime-gpu==1.27.0`, built for CUDA 13 and cuDNN 9, matching the
PyTorch cu130 base. Linux ARM64 is not supported by this recipe.

When using this base directly, run Python with `pixi run python` from `/app`.
Import `torch` before creating an ONNX Runtime session to load its CUDA and
cuDNN libraries, and select `CUDAExecutionProvider` for GPU inference.

## Tags

| Tag | Dockerfile | Notes |
| --- | --- | --- |
| `py3.13-cu13.0-torch2.9.0-1.27.0` | `./py3.13-cu13.0-torch2.9.0-1.27.0/Dockerfile` | ONNX Runtime 1.27.0 with CUDA 13.0 atop PyTorch 2.9.0 |

## Build locally

```bash
docker buildx build --platform linux/amd64 . \
  -f dockerfiles/bases/onnxruntime/py3.13-cu13.0-torch2.9.0-1.27.0/Dockerfile \
  --load -t ghcr.io/nekomeowww/oci-ml-onnxruntime:py3.13-cu13.0-torch2.9.0-1.27.0
```
