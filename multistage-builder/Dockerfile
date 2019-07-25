
ARG ALPINE_VERSION

FROM alpine:$ALPINE_VERSION
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

USER root
WORKDIR /root/download

RUN apk --update add openssl curl wget
