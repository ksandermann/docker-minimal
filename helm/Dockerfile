######################################################### TOOLCHAIN VERSIONING #########################################

ARG BUILDER_VERSION
ARG HELM_VERSION

######################################################### BUILDER ######################################################

FROM ksandermann/multistage-builder:$BUILDER_VERSION as builder
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

ARG TARGETARCH
ARG HELM_VERSION

RUN curl -SsL --retry 5 "https://get.helm.sh/helm-$HELM_VERSION-linux-$TARGETARCH.tar.gz" | tar xz


######################################################### IMAGE ########################################################
FROM bash:latest
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

ARG TARGETARCH

COPY --from=builder "/root/download/linux-$TARGETARCH/helm" "/usr/local/bin/helm"

RUN chmod +x "/usr/local/bin/helm" && \
    helm version --client

CMD ["helm"]
