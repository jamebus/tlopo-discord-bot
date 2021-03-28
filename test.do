# shellcheck shell=sh
set -u

exec >&2

global_config_file='./config.od'

redo-ifchange "$global_config_file" .build_id docker_command

build_id=$(cat .build_id)

# shellcheck source=config.od
. "$global_config_file"

image_full="${repo_local}/${image}:${build_id}"
test_rc=0

for p in $(echo "$build_platform" | tr ',' ' '); do
	container=$(./docker_command run -d --rm --platform="$p" "$image_full")
	sleep 15

	if ! ./docker_command exec "$container" test -x /discord-bot/start; then
		echo "${p}: Missing /discord-bot/start or it isn't executable"
		test_rc=$((test_rc + 1))
	fi

	if ! ./docker_command exec "$container" \
	     test -f /discord-bot/bot/__init__.py; then
		echo "${p}: Missing /discord-bot/bot/__init__.py"
		test_rc=$((test_rc + 1))
	fi

	if ! ./docker_command logs "$container" 2>&1 | \
	     grep '^:BotStart: Connecting\.\.\.$' >/dev/null; then
		echo "${p}: bot doesn't appear to start"
		test_rc=$((test_rc + 1))
	fi

	./docker_command stop "$container" >/dev/null || true
done

test $test_rc -eq 0
