# shellcheck shell=sh
set -u

redo-ifchange pipgrip.lock

cp pipgrip.lock "$3"
