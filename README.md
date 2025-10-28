<h1 align="center">OCI Images for Machine Learning</h1>

> Best for MLOps, LLMOps, and developing models or work with weights locally.

Container recipes that back the machine-learning images published under
`ghcr.io/nekomeowww`. The repository is organised around reusable base images and
higher level tooling built on top of them.

## Base Environments

- `ghcr.io/nekomeowww/oci-ml-python` — [source](./dockerfiles/bases/python/README.md)
- `ghcr.io/nekomeowww/oci-ml-nvidia-cuda` — [source](./dockerfiles/bases/nvidia-cuda/README.md)
- `ghcr.io/nekomeowww/oci-ml-pytorch` — [source](./dockerfiles/bases/torch/README.md)
- `ghcr.io/nekomeowww/oci-ml-onnxruntime` — [source](./dockerfiles/bases/onnxruntime/README.md)

## CLI Tools

### `optimum-cli`

See [source](./dockerfiles/clis/optimum-cli/README.md) for available tags and
dependency graph.

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
