#!/bin/sh

cd -- "$(dirname -- "$0")"

exec ./common.sh --entrypoint bash 'synobuild:latest'
