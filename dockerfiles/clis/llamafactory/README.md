# oci-ml-llamafactory

Images published as `ghcr.io/nekomeowww/oci-ml-llamafactory`. They package
[LLaMA-Factory](https://github.com/hiyouga/LLaMA-Factory) (`llamafactory-cli`) on
top of the PyTorch base, wiring the Pixi shell hook as the container entrypoint.

The environment is also on `PATH`, so a Kubernetes `command` that replaces the
entrypoint (for example `llamafactory-cli train config.yaml`) works too. AnyGPU's
Modal driver requires an explicit command, so training Jobs run the image this way.

## Tags

| Tag | Dockerfile | Depends on |
| --- | --- | --- |
| `0.9.5` | `./0.9.5/Dockerfile` | `ghcr.io/nekomeowww/oci-ml-pytorch:py3.13-cu13.0-2.10.0` |

## Contents of `0.9.5`

| Package | Version | Why |
| --- | --- | --- |
| `llamafactory` | 0.9.5 | Fine-tuning CLI |
| `torch` / `torchvision` / `torchaudio` | 2.10.0 / 0.25.0 / 2.10.0 (CUDA 13.0) | Same PyTorch as the base, so it is not installed twice. LLaMA-Factory refuses 2.9.x for models with a `Conv3d`, such as Qwen3.6 |
| `transformers` | 5.5.x | 5.6.0 breaks the FlashAttention path ([LLaMA-Factory#10610](https://github.com/hiyouga/LLaMA-Factory/issues/10610)); 5.5 already has `qwen3_5_moe` (Qwen3.6) |
| `flash-linear-attention` | 0.5.2 | Gated DeltaNet kernels for Qwen3.5 / Qwen3.6; 0.6.0 needs transformers>=5.6.2 |
| `gcc` / `c-compiler` (conda-forge) | 15.2 / 2.0 | Same as the base: Triton compiles a C launcher for each kernel at runtime |

The lock file started from the PyTorch base's lock, so Python, CUDA, and PyTorch
keep the base's exact builds and this layer only adds about 1.4 GB. When you
update the lock, start from the base's `pixi.lock` again: a fresh resolve picks
newer CUDA 13.x packages and installs the whole stack a second time.

`causal-conv1d` is not included: PyPI only has a source distribution, which
compiles CUDA code against the installed PyTorch. Without it, Qwen3.5 / Qwen3.6
use the PyTorch implementation of the short convolution, and transformers logs
"fast path is not available". The gated delta rule still runs on the
flash-linear-attention kernels: transformers falls back per operation.

LLaMA-Factory 0.9.5 cannot read JSON training configs (it passes a `Path` to
`json.load`); use YAML.

## Run

```bash
docker run --rm --gpus all -it ghcr.io/nekomeowww/oci-ml-llamafactory:0.9.5
docker run --rm --gpus all -v "$PWD:/work" -w /work \
  ghcr.io/nekomeowww/oci-ml-llamafactory:0.9.5 llamafactory-cli train config.yaml
```

## Build locally

```bash
docker buildx build --platform linux/amd64 . \
  -f dockerfiles/clis/llamafactory/0.9.5/Dockerfile \
  --load -t ghcr.io/nekomeowww/oci-ml-llamafactory:0.9.5
```

This GPU image supports Linux x86_64 (`linux/amd64`) only. The host needs an
NVIDIA GPU, a driver that supports CUDA 13.0, and NVIDIA Container Toolkit.
