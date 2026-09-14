# oci-ml-optimum-cli

Images published as `ghcr.io/nekomeowww/oci-ml-optimum-cli`. They package the
Hugging Face Optimum CLI on top of the ONNX Runtime base, wiring the Pixi shell
hook as the container entrypoint.

## Tags

| Tag | Dockerfile | Depends on |
| --- | --- | --- |
| `0.0.3` | `./0.0.3/Dockerfile` | `ghcr.io/nekomeowww/oci-ml-onnxruntime:py3.13-cu13.0-torch2.9.0-1.27.0` |

## Run

```bash
docker run --rm --gpus all -it ghcr.io/nekomeowww/oci-ml-optimum-cli:0.0.3 --help
```

## Build locally

```bash
docker buildx build --platform linux/amd64 . \
  -f dockerfiles/clis/optimum-cli/0.0.3/Dockerfile \
  --load -t ghcr.io/nekomeowww/oci-ml-optimum-cli:0.0.3
```

This GPU image supports Linux x86_64 (`linux/amd64`) only and uses
`optimum-onnx[onnxruntime-gpu]` with `onnxruntime-gpu==1.27.0`.
The host needs an NVIDIA GPU and NVIDIA Container Toolkit for GPU execution.
