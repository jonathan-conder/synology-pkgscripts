FROM archlinux:latest
ARG SCRIPTS_VER=6e31a49
ARG PKG_ARCH=x64
ARG DSM_VER=5.2

RUN pacman -Syu --noconfirm git python2 wget && \
    echo 'quiet = on' >> /etc/wgetrc

RUN git clone https://github.com/SynologyOpenSource/pkgscripts /toolkit/pkgscripts && \
    git -C /toolkit/pkgscripts switch -d ${SCRIPTS_VER} && \
    /toolkit/pkgscripts/EnvDeploy -y -p ${PKG_ARCH} -v ${DSM_VER}

COPY source /toolkit/source
COPY docker/entrypoint.sh /toolkit/pkgscripts

ENTRYPOINT ["/toolkit/pkgscripts/entrypoint.sh"]
