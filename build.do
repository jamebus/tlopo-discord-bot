# shellcheck shell=sh
set -u

rm -f .no-cache
redo-ifchange .build_id
