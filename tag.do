# shellcheck shell=sh
set -u

exec >&2

config_file='./config.od'
build_config_file='./build-config.od'

redo-ifchange "$config_file" "$build_config_file" .build_id test docker_command

build_id=$(cat .build_id)

# shellcheck source=config.od
. "$config_file"
# shellcheck source=build-config.od
. "$build_config_file"

for tag in $tags; do
	./docker_command tag "${image}:${build_id}" "${image}:${tag}"

	if [ -n "${repo:-}" ]; then
		./docker_command tag "${image}:${build_id}" "${repo}/${image}:${tag}"
	fi
done
