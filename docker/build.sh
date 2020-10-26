#!/bin/sh

if [ $# -ne 2 ]; then
	echo "Usage: $0 arch version"
	exit 1
fi

cd -- "$(dirname -- "$0")"
cd ..

DOCKER_BUILTKIT=1 exec docker build \
	-f 'docker/Dockerfile' \
	--build-arg "PKG_ARCH=${1}" \
	--build-arg "DSM_VER=${2}" \
	-t "synobuild:${1}-${2}" \
	-t "synobuild:latest" \
	.
