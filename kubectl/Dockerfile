######################################################### TOOLCHAIN VERSIONING #########################################

ARG BUILDER_VERSION
ARG KUBECTL_VERSION

######################################################### BUILDER ######################################################

FROM ksandermann/multistage-builder:$BUILDER_VERSION as builder
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

ARG KUBECTL_VERSION

RUN if [[$(uname -m) == "aarch64"]]; then ARCH="arm64"; else ARCH="amd64"; fi && \
    wget https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/$ARCH/kubectl -O /root/download/kubectl

######################################################### IMAGE ########################################################
FROM bash:5.1.16
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

COPY --from=builder "/root/download/kubectl" "/usr/local/bin/kubectl"

RUN chmod +x "/usr/local/bin/kubectl" && \
    kubectl version --client=true

CMD ["kubectl"]
