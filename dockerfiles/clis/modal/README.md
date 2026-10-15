# oci-ml-modal

Images published as `ghcr.io/nekomeowww/oci-ml-modal`. They package the
[Modal](https://modal.com) client (Python SDK and `modal` CLI) on top of the
Python base, wiring the Pixi shell hook as the container entrypoint.

The environment is also on `PATH`, so a Kubernetes `command` that replaces the
entrypoint (for example `python -u script.py`) works too. AnyGPU uses it this way
to move PVC data to and from Modal Volumes.

## Tags

| Tag | Dockerfile | Depends on |
| --- | --- | --- |
| `1.5.4` | `./1.5.4/Dockerfile` | `ghcr.io/nekomeowww/oci-ml-python:3.13` |

## Run

```bash
docker run --rm ghcr.io/nekomeowww/oci-ml-modal:1.5.4 modal --help
docker run --rm -e MODAL_TOKEN_ID -e MODAL_TOKEN_SECRET \
  ghcr.io/nekomeowww/oci-ml-modal:1.5.4 modal volume list
```

## Build locally

```bash
docker buildx build --platform linux/amd64 . \
  -f dockerfiles/clis/modal/1.5.4/Dockerfile \
  --load -t ghcr.io/nekomeowww/oci-ml-modal:1.5.4
```

The image has no GPU dependencies. Its lock file covers `linux-64` and
`linux-aarch64`.
