######################################################### TOOLCHAIN VERSIONING #########################################

ARG BUILDER_VERSION
ARG OC_CLI_SOURCE

######################################################### BUILDER ######################################################

FROM ksandermann/multistage-builder:$BUILDER_VERSION as builder
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

ARG OC_CLI_SOURCE

RUN touch oc_cli.tar.gz && \
    mkdir -p oc_cli && \
    curl -SsL --retry 5 -o oc_cli.tar.gz $OC_CLI_SOURCE && \
    tar xf oc_cli.tar.gz -C oc_cli && \
    cp oc_cli/*/* oc_cli


######################################################### IMAGE ########################################################
FROM bash:5.0.7
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

COPY --from=builder "/root/download/oc_cli/oc" "/usr/local/bin/oc"

RUN chmod +x "/usr/local/bin/oc"

CMD ["oc"]