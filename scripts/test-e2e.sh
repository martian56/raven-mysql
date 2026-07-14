#!/usr/bin/env sh
set -eu

repo=$(CDPATH= cd -- "$(dirname -- "$0")/.." && pwd)
cd "$repo"

cleanup() {
    if [ "${KEEP_MYSQL:-0}" != "1" ]; then
        docker compose down --volumes
    fi
}
trap cleanup EXIT INT TERM

docker compose up -d --wait
export RAVEN_MYSQL_E2E=1
export RAVEN_MYSQL_HOST=${RAVEN_MYSQL_HOST:-127.0.0.1}
export RAVEN_MYSQL_PORT=${RAVEN_MYSQL_PORT:-33306}
export RAVEN_MYSQL_USER=${RAVEN_MYSQL_USER:-raven}
export RAVEN_MYSQL_PASSWORD=${RAVEN_MYSQL_PASSWORD:-ravenpw}
export RAVEN_MYSQL_DATABASE=${RAVEN_MYSQL_DATABASE:-ravendb}
${RVPM:-rvpm} test
