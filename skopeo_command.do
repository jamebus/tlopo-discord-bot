# shellcheck shell=sh
set -u

config_file='./config.od'

redo-ifchange "$config_file"

# shellcheck source=config.od
. "$config_file"

echo "#!${SHELL}" > "$3"

cat << '_EOF_' >> "$3"
command="$1"
shift
_EOF_

echo exec skopeo ${skopeo_opts:-} \
                 '"$command"' ${skopeo_command_opts:-} '"$@"' >> "$3"
chmod a+x "$3"
