#!/bin/bash

set -e
shopt -s nullglob

if [ $# -ne 2 ]; then
	echo "Usage: $0 src dest"
	exit 1
fi

for srcdir in "$1"/*; do
	[ -d "$srcdir" ] || continue
	destdir="${2}/$(basename -- "$srcdir")"
	[ -d "$destdir" ] && [ -n "$(ls -A -- "$destdir")" ] || continue

	for patch in "$srcdir"/*.patch; do
		patch -p1 -d "$destdir" -i "$patch"
	done

	for script in "$srcdir"/*.sh; do
		chroot "$destdir" /bin/bash < "$script"
	done
done
