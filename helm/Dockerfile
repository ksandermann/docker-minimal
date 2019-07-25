######################################################### TOOLCHAIN VERSIONING #########################################

ARG BUILDER_VERSION
ARG HELM_VERSION

######################################################### BUILDER ######################################################

FROM ksandermann/multistage-builder:$BUILDER_VERSION as builder
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

ARG HELM_VERSION

RUN curl -SsL --retry 5 "https://get.helm.sh/helm-$HELM_VERSION-linux-amd64.tar.gz" | tar xz


######################################################### IMAGE ########################################################
FROM bash:5.0.7
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

COPY --from=builder "/root/download/linux-amd64/helm" "/usr/local/bin/helm"

RUN chmod +x "/usr/local/bin/helm" && \
    helm version --client

CMD ["helm"]