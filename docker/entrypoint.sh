#!/bin/sh

cd -- "$(dirname -- "$0")"

# source needs to be on the same mount as the chroot
if [ -d '/mnt/source' ]; then
	rm -rf '../source'
	cp -a '/mnt/source' ..
fi

exec ./PkgCreate.py -x0 --no-sign -c "$@"
