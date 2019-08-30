# shellcheck shell=sh
set -u

config_file='./config.od'

redo-ifchange "$config_file"

# shellcheck source=config.od
. "$config_file"

echo "#!${SHELL}" > "$3"
echo env $docker_env \
     docker ${docker_opts:-} '"$@"' >> "$3"
chmod a+x "$3"
