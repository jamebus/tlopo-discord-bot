# shellcheck shell=sh
set -u

exec >&2

config_file='./config.od'
build_config_file='./build-config.od'

redo-ifchange "$config_file" "$build_config_file" test skopeo_command

build_id=$(cat .build_id)

# shellcheck source=config.od
. "$config_file"
# shellcheck source=build-config.od
. "$build_config_file"

if [ -z "${repo:-}" ]; then
	echo 'No repository configured. Please set one in config.od'
	exit 1
fi

if [ -z "${repo_local:-}" ]; then
	echo 'No local repository configured. Please set one in config.od'
	exit 1
fi

for tag in $tags; do
	./skopeo_command copy --all "docker://${repo_local}/${image}:${build_id}" \
	                            "docker://${repo}/${image}:${tag}"
done
