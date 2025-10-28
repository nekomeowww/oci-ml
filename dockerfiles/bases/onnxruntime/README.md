# oci-ml-onnxruntime

Images published as `ghcr.io/nekomeowww/oci-ml-onnxruntime`. They extend the
PyTorch base with ONNX Runtime GPU builds for serving and optimization
workloads.

## Tags

| Tag | Dockerfile | Notes |
| --- | --- | --- |
| `py3.13-cu13.0-torch2.9.0-1.23.2` | `./py3.13-cu13.0-torch2.9.0-1.23.2/Dockerfile` | ONNX Runtime 1.23.2 with CUDA 13.0 atop PyTorch 2.9.0 |

## Build locally

```bash
docker buildx build . \
  -f dockerfiles/bases/onnxruntime/py3.13-cu13.0-torch2.9.0-1.23.2/Dockerfile \
  --load -t ghcr.io/nekomeowww/oci-ml-onnxruntime:py3.13-cu13.0-torch2.9.0-1.23.2
```
