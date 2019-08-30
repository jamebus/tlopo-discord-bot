# shellcheck shell=sh
set -u

exec >&2

config_file='./config.od'
build_config_file='./build-config.od'

redo-ifchange "$config_file" "$build_config_file" tag docker_command

# shellcheck source=config.od
. "$config_file"
# shellcheck source=build-config.od
. "$build_config_file"

if [ -z "${repo:-}" ]; then
	echo 'No repository configured. Please set one in config.od'
	exit 1
fi

for tag in $tags; do
	./docker_command push "${repo}/${image}:${tag}"
done
