#!/bin/bash
set -x

aver=${aver:-1.0-beta4}
arch=${arch:-amd64}
amir=https://distfiles.adelielinux.org/adelie/
prefix=${prefix:-paleozogt}
image=${prefix}/adelie:${arch}-${aver}

if [[ "${arch}" == "amd64" ]]; then
    dlarch=x86_64
elif [[ "${arch}" == "arm64" ]]; then
    dlarch=aarch64
else
    dlarch=${arch}
fi

curl -S ${amir}/stable/iso/adelie-rootfs-mini-${dlarch}-${aver}.txz \
    | docker import - ${image}

docker-copyedit/docker-copyedit.py FROM ${image} INTO ${image} -vv \
    set cmd '["/bin/sh"]' and \
    set arch ${arch}

docker tag ${image} ${prefix}/adelie:${arch}
