# oci-ml-optimum-cli

Images published as `ghcr.io/nekomeowww/oci-ml-optimum-cli`. They package the
Hugging Face Optimum CLI on top of the ONNX Runtime base, wiring the Pixi shell
hook as the container entrypoint.

## Tags

| Tag | Dockerfile | Depends on |
| --- | --- | --- |
| `0.0.3` | `./0.0.3/Dockerfile` | `ghcr.io/nekomeowww/oci-ml-onnxruntime:py3.13-cu13.0-torch2.9.0-1.23.2` |

## Run

```bash
docker run --rm -it ghcr.io/nekomeowww/oci-ml-optimum-cli:0.0.3 --help
```

## Build locally

```bash
docker buildx build . \
  -f dockerfiles/clis/optimum-cli/0.0.3/Dockerfile \
  --load -t ghcr.io/nekomeowww/oci-ml-optimum-cli:0.0.3
```
