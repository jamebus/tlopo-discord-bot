# shellcheck shell=sh

case $2 in
	.build_id)
		. ./build_id.od
		;;
	*)
		echo "Error: $1: no rule to build this target." >&2
		exit 1
		;;
esac
