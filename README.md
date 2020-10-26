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

## Acknowledgements

Partially based on [synology-wireguard](https://github.com/runfalk/synology-wireguard) and of course [pkgscripts](https://github.com/SynologyOpenSource/pkgscripts).
