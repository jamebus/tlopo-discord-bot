# shellcheck shell=sh
set -u

redo-ifchange requirements.txt build test
