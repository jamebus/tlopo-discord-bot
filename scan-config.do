# shellcheck shell=sh
set -u

exec >&2

redo-ifchange Dockerfile .trivyignore

trivy config --exit-code=1 Dockerfile
