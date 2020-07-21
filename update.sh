#!/usr/bin/env bash

QOOXDOO_VERSIONS=(
  2.1.2=release_2_1_2
  3.5.1=release_3_5_1
  4.1.1=release_4_1_1
  5.0.2=release_5_0_2
  5.0.3=5.0.4
)


for version in "${QOOXDOO_VERSIONS[@]}"; do

version=(${version//=/ })
qx_version=${version[0]}
git_tag=${version[1]}

mkdir -p ${git_tag}
DOCKERFILE=${git_tag}/Dockerfile

/bin/cat <<EOM >${DOCKERFILE}
FROM python:2.7.14-alpine3.7

RUN apk update \\
    && apk add --virtual .build-deps git \\
    && mkdir -p /source \\
    && git clone https://github.com/qooxdoo/qooxdoo.git /qooxdoo \\
    && cd /qooxdoo/ \\
    && git checkout tags/${git_tag} \\
    && rm -rf ./.git ./.gitattributes ./.gitignore ./documentation \\
    && apk del .build-deps

ENV QOOXDOO_PATH /qooxdoo
ENV QOOXDOO_VERSION ${qx_version}
CMD echo qooxdoo version \$QOOXDOO_VERSION

WORKDIR /source
VOLUME /source
EOM

done
