# shellcheck shell=sh
set -u

exec >&2

redo-ifchange Dockerfile

trivy config --exit-code=1 Dockerfile
