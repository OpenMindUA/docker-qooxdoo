FROM python:2.7.14-alpine3.7

RUN apk update \
    && apk add git


RUN mkdir -p /source
    && git clone https://github.com/qooxdoo/qooxdoo.git /qooxdoo \
    && cd /qooxdoo/ \
    && git checkout tags/release_3_5_1 \
    && rm -rf ./.git ./.gitattributes ./.gitignore ./documentation

ENV QOOXDOO_PATH /qooxdoo
ENV QOOXDOO_VERSION 3.5.1
CMD echo qooxdoo version $QOOXDOO_VERSION

WORKDIR /source
VOLUME /source
