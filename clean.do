# shellcheck shell=sh
set -u

rm -f requirements.txt docker_command skopeo_command Dockerfile \
      .build_id .no-cache
