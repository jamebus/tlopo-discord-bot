# shellcheck shell=sh
set -u

exec >&2

config_file='./config.od'

redo Dockerfile-deps
redo-ifchange "$config_file" .build_id_deps docker_command

build_id=$(cat .build_id_deps)

# shellcheck source=config.od
. "$config_file"

image_full="${repo_local}/${image}:${build_id}"

container=$(./docker_command run -d --rm --entrypoint=sleep "$image_full" 60)
./docker_command cp "${container}:/tmp/pipgrip.lock" pipgrip.lock
./docker_command stop "$container" >/dev/null || true
