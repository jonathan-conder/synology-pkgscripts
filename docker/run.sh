#!/bin/sh

cd -- "$(dirname -- "$0")"

exec ./common.sh 'synobuild:latest' "$@"
