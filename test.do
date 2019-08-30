# shellcheck shell=sh
set -u

exec >&2

global_config_file='./config.od'

redo-ifchange "$global_config_file" .build_id docker_command

build_id=$(cat .build_id)

# shellcheck source=config.od
. "$global_config_file"

container=$(./docker_command run -d --rm "${image}:${build_id}")

sleep 3

test_rc=0

if ! ./docker_command exec "$container" test -x /discord-bot/start; then
	echo "Missing /discord-bot/start or it isn't executable"
	test_rc=$((test_rc + 1))
fi

if ! ./docker_command exec "$container" test -f /discord-bot/bot/__init__.py; then
	echo 'Missing /discord-bot/bot/__init__.py'
	test_rc=$((test_rc + 1))
fi

if ! ./docker_command logs "$container" 2>&1 | \
     grep '^:BotStart: Connecting...$' >/dev/null; then
	echo "bot doesn't appear to start"
	test_rc=$((test_rc + 1))
fi

./docker_command stop "$container" >/dev/null || true

test $test_rc -eq 0
