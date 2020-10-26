#!/bin/sh

cd -- "$(dirname -- "$0")"
cd ..

exec docker run \
	-it \
	--rm \
	--cap-add SYS_ADMIN \
	--mount "type=bind,source=${PWD}/source,destination=/mnt/source" \
	--mount "type=bind,source=${PWD}/artifacts,destination=/toolkit/result_spk" \
	"$@"
