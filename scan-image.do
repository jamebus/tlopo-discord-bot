# shellcheck shell=sh
set -u

exec >&2

config_file='./config.od'

redo-ifchange "$config_file" .build_id

build_id=$(cat .build_id)

# shellcheck source=config.od
. "$config_file"

image_full="${repo_local}/${image}:${build_id}"

trivy image --exit-code=1 "$image_full"
