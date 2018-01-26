FROM python:2.7.14-alpine3.7

RUN apk update \
    && apk add git


RUN git clone https://github.com/qooxdoo/qooxdoo.git /qooxdoo \
    && cd /qooxdoo/ \
    && git checkout tags/release_2_1_2 \
    && rm -rf ./.git ./.gitattributes ./.gitignore ./documentation

ENV QOOXDOO_PATH /qooxdoo
ENV QOOXDOO_VERSION 2.1.2
CMD echo qooxdoo version $QOOXDOO_VERSION
