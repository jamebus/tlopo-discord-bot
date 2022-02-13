# shellcheck shell=sh
set -u

exec >&2

redo-ifchange requirements.txt

trivy filesystem --exit-code=1 --ignore-unfixed requirements.txt
