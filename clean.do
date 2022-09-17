# shellcheck shell=sh
set -u

rm -f requirements.txt docker_command skopeo_command Dockerfile \
      Dockerfile-deps .build_id .build_id_deps .no-cache
find bot -type f -name \*.py\[co\] -print0 | xargs -0 rm -f
find bot -type d -name __pycache__ -print0 | xargs -0 rm -rf
