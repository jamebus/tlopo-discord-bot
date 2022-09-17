# shellcheck shell=sh
set -u

infile='Dockerfile.tmpl'
build_config_file='./build-config.od'

redo-ifchange "$build_config_file" "$infile"

# shellcheck source=build-config.od
. "$build_config_file"

env TMPL_finding_deps="${finding_deps:-}" \
    TMPL_jo_version="$jo_version" \
    TMPL_jo_dist_url="$jo_dist_url" \
    TMPL_jo_dist_sha256="$jo_dist_sha256" \
    TMPL_python_dependencies_pipgrip="$python_dependencies_pipgrip" \
    TMPL_python_wheel_version="$python_wheel_version" \
    TMPL_security_apk_builder="$security_apk_builder" \
    TMPL_security_apk_runtime="$security_apk_runtime" gomplate < "$infile" > "$3"

redo-stamp < "$3"
