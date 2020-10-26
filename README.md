# Synology pkgscripts container

## Usage

If you want to build one of the included packages, be sure to download them with:
```console
$ git submodule update --init --recursive
```

These instructions assume that your device has platform `ipq806x` and SRM version `1.2`.
If not, simply replace `ipq806x` (resp. `1.2`) with the correct platform (resp. DSM/SRM version).
[This table](https://github.com/SynoCommunity/spksrc/wiki/Architecture-per-Synology-model) may help you decide what platform to use.

First, create a docker image to hold the build scripts and cross compilation environment:
```console
# docker/build.sh ipq806x 1.2
```

To build the example package:
```console
# docker/run.sh minimalPkg -v 1.2 minimalPkg
```
The `-v` option may be omitted if you append `ipq806x="1.2"` to [`source/minimalPkg/SynoBuildConf/depends`](https://github.com/SynologyOpenSource/minimalPkg/blob/master/SynoBuildConf/depends).

If the package was built successfully, you will find it under [`artifacts`](artifacts).

You can also build packages from a shell inside the container:
```console
# docker/interact.sh
# /toolkit/pkgscripts/entrypoint.sh -v 1.2 minimalPkg
```

[This guide](https://help.synology.com/developer-guide/index.html) explains how to create packages for [pkgscripts-ng](https://github.com/SynologyOpenSource/pkgscripts-ng), most of which still applies to [pkgscripts](https://github.com/SynologyOpenSource/pkgscripts) packages.
Place your package in `source/{PACKAGE_NAME}`.

## Building kernel modules

Although [pkgscripts](https://github.com/SynologyOpenSource/pkgscripts) does not seem to support this, it is fairly straightforward to backport a kernel module packaged for [pkgscripts-ng](https://github.com/SynologyOpenSource/pkgscripts-ng) ([here is an example](https://github.com/jonathan-conder/HelloKernel/commit/0cf799cdc605d705b399e42ba3347276fdef32fb)).
[This guide](https://help.synology.com/developer-guide/create_package/compile_kernel_module.html) may also be useful.
However, you may have to patch the toolchain to expose the `KSRC` and `CROSS_COMPILE` variables ([here is an example](patches/build_env/ds.ipq806x-1.2/kconfig.patch)).
Synology provides [kernel source code](http://sourceforge.net/projects/dsgpl/files/Synology%20NAS%20GPL%20Source/7274branch/) for each platform, in case some files are missing from the build environment.

## Acknowledgements

Partially based on [synology-wireguard](https://github.com/runfalk/synology-wireguard) and of course [pkgscripts](https://github.com/SynologyOpenSource/pkgscripts).
