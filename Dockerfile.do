# shellcheck shell=sh
set -u

infile="${2}.in"
build_config_file="./build-config.od"
awkfile='t.awk'

redo-ifchange "$build_config_file" "$awkfile" "$infile"

# shellcheck source=build-config.od
. "$build_config_file"

# Ensure newlines are removed in all shells
python_dependencies=$(echo $python_dependencies)

awk -v jo_version="${jo_version}" \
    -v jo_dist_url="${jo_dist_url}" \
    -v jo_dist_sha256="${jo_dist_sha256}" \
    -v python_dependencies="${python_dependencies}" -f "$awkfile" < "$infile"
