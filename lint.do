# shellcheck shell=sh
set -u

exec >&2

redo-ifchange Dockerfile

hadolint Dockerfile
