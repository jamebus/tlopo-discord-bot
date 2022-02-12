# shellcheck shell=sh
set -u

exec >&2

redo-ifchange Dockerfile requirements.txt
find bot -type f -print0 | xargs -0 redo-ifchange

trivy filesystem --exit-code=1 .
