# shellcheck shell=sh
set -u

build_config_file='./build-config.od'

redo-ifchange "$build_config_file"

# shellcheck source=build-config.od
. "$build_config_file"

for d in $python_dependencies; do
	echo "$d"
done
