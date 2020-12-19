# shellcheck shell=sh
set -u

exec >&2

redo-ifchange docker_command

./docker_command container prune -f
./docker_command image prune -f
./docker_command buildx prune -f
