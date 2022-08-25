######################################################### TOOLCHAIN VERSIONING #########################################

ARG BUILDER_VERSION
ARG OC_CLI_VERSION

######################################################### BUILDER ######################################################

FROM ksandermann/multistage-builder:$BUILDER_VERSION as builder
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

ARG TARGETARCH
ARG OC_CLI_VERSION

WORKDIR /root/download
RUN mkdir -p oc_cli && \
    curl -SsL --retry 5 -o oc_cli.tar.gz https://mirror.openshift.com/pub/openshift-v4/$TARGETARCH/clients/ocp/stable/openshift-client-linux-$OC_CLI_VERSION.tar.gz && \
    tar xvf oc_cli.tar.gz -C oc_cli


######################################################### IMAGE ########################################################
FROM bash:5.1.16
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

COPY --from=builder "/root/download/oc_cli/oc" "/usr/local/bin/oc"

RUN chmod +x "/usr/local/bin/oc"

CMD ["oc"]
