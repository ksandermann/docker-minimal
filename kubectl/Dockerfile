######################################################### TOOLCHAIN VERSIONING #########################################

ARG BUILDER_VERSION
ARG KUBECTL_VERSION

######################################################### BUILDER ######################################################

FROM ksandermann/multistage-builder:$BUILDER_VERSION as builder
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

ARG KUBECTL_VERSION

RUN wget https://storage.googleapis.com/kubernetes-release/release/$KUBECTL_VERSION/bin/linux/amd64/kubectl -O /root/download/kubectl

######################################################### IMAGE ########################################################
FROM bash:5.0.7
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

COPY --from=builder "/root/download/kubectl" "/usr/local/bin/kubectl"

RUN chmod +x "/usr/local/bin/kubectl" && \
    kubectl version --client=true

CMD ["kubectl"]