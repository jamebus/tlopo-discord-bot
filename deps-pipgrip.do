# shellcheck shell=sh
set -u

exec >&2

redo-ifchange docker_command

cat << _EOF_ | ./docker_command run --rm -i --pull=always python:3-alpine sh
set -exu

pip install pipgrip
pipgrip --sort pipgrip
_EOF_
