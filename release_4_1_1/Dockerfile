FROM python:2.7-alpine

RUN apk update \
    && apk add --virtual .build-deps git \
    && mkdir -p /source \
    && git clone https://github.com/qooxdoo/qooxdoo.git /qooxdoo \
    && cd /qooxdoo/ \
    && git checkout tags/release_4_1_1 \
    && rm -rf ./.git ./.gitattributes ./.gitignore ./documentation \
    && apk del .build-deps

ENV QOOXDOO_PATH /qooxdoo
ENV QOOXDOO_VERSION 4.1.1
CMD echo qooxdoo version $QOOXDOO_VERSION

WORKDIR /source
VOLUME /source
