#!/bin/sh

# upgrade make to work around this bug:
# https://stackoverflow.com/questions/2428506/workaround-for-gnu-make-3-80-eval-bug
set -e

mkdir -p /src/make
cd /src/make

srcdir='make-4.2.1'
tarball="${srcdir}.tar.bz2"

# easier than installing curl or wget in the chroot
python2 <<EOF
import urllib2

r = urllib2.urlopen("http://ftp.gnu.org/gnu/make/${tarball}")
with open("${tarball}", "wb") as f:
	for chunk in iter(lambda: r.read(0x1000), ""):
		f.write(chunk)
EOF

tar -xf "$tarball"
cd "$srcdir"

./configure --prefix=/usr
make install
