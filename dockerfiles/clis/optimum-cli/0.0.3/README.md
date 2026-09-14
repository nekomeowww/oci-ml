# `oci-ml-optimum-cli`

Container image for the Hugging Face Optimum CLI with CUDA-enabled ONNX Runtime
support.

- Image: `ghcr.io/nekomeowww/oci-ml-optimum-cli:0.0.3`
- Base image: `ghcr.io/nekomeowww/oci-ml-onnxruntime:py3.13-cu13.0-torch2.9.0-1.27.0`

## Dependencies (build chain)

1. `ghcr.io/nekomeowww/oci-ml-onnxruntime:py3.13-cu13.0-torch2.9.0-1.27.0`
2. `ghcr.io/nekomeowww/oci-ml-pytorch:py3.13-cu13.0-2.9.0`
3. `ghcr.io/nekomeowww/oci-ml-nvidia-cuda:py3.13-13.0`
4. `ghcr.io/nekomeowww/oci-ml-python:3.13`

## Usage

```bash
docker run --rm --gpus all -it ghcr.io/nekomeowww/oci-ml-optimum-cli:0.0.3 --help
```

This GPU image supports Linux x86_64 (`linux/amd64`) only and uses
`optimum-onnx[onnxruntime-gpu]` with `onnxruntime-gpu==1.27.0`.
The host needs an NVIDIA GPU and NVIDIA Container Toolkit for GPU execution.
