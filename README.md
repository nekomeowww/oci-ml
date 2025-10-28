<h1 align="center">OCI Images for Machine Learning</h1>

> Best for MLOps, LLMOps, and developing models or work with weights locally.

Container recipes that back the machine-learning images published under
`ghcr.io/nekomeowww`. The repository is organised around reusable base images and
higher level tooling built on top of them.

## Base Environments

| Image | Tag |
| --- | --- |
| `ghcr.io/nekomeowww/oci-ml-python` | `3.13` |
| `ghcr.io/nekomeowww/oci-ml-nvidia-cuda` | `py3.13-13.0` |
| `ghcr.io/nekomeowww/oci-ml-pytorch` | `py3.13-cu13.0-2.9.0` |
| `ghcr.io/nekomeowww/oci-ml-onnxruntime` | `py3.13-cu13.0-torch2.9.0-1.23.2` |

## CLI Tools

### `optimum-cli`

| Image | Tag | Dependency |
| --- | --- | --- |
| `ghcr.io/nekomeowww/oci-ml-optimum-cli` | `0.0.3` | `optimum-cli ← onnxruntime:1.23.2 ← pytorch:2.9.0 ← nvidia-cuda:13.0 ← python:3.13` |

```shell
docker pull ghcr.io/nekomeowww/oci-ml-optimum-cli:0.0.3
```

## Building locally

Use Docker Buildx (or regular `docker build`) from the repository root. The
helper script below rebuilds the current stack in dependency order:

```bash
./dockerfiles/clis/optimum-cli/0.0.3/build.sh
```

Each image can also be built individually. For example, to rebuild the PyTorch
base image:

```bash
docker buildx build . \
  -f dockerfiles/bases/torch/py3.13-cu13.0-2.9.0/Dockerfile \
  --load -t ghcr.io/nekomeowww/oci-ml-pytorch:py3.13-cu13.0-2.9.0
```
