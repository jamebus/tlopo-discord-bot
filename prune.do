# shellcheck shell=sh
set -u

exec >&2

redo-ifchange docker_command

./docker_command container prune -f
./docker_command image prune -f -a
./docker_command buildx prune -f
