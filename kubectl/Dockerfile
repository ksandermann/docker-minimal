######################################################### TOOLCHAIN VERSIONING #########################################

ARG BUILDER_VERSION
ARG KUBECTL_VERSION

######################################################### BUILDER ######################################################

FROM ksandermann/multistage-builder:$BUILDER_VERSION as builder
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

ARG TARGETARCH
ARG KUBECTL_VERSION

RUN wget -q https://dl.k8s.io/release/$KUBECTL_VERSION/bin/linux/$TARGETARCH/kubectl -O /root/download/kubectl
RUN mkdir -p /root/download/kubelogin/ && mkdir -p /root/download/binaries/ && \
  wget -q https://github.com/Azure/kubelogin/releases/latest/download/kubelogin-linux-${TARGETARCH}.zip -O /root/download/kubelogin/kubelogin.zip && \
  unzip /root/download/kubelogin/kubelogin.zip -d /root/download/kubelogin/ && \
  mv /root/download/kubelogin/bin/linux_${TARGETARCH}/kubelogin "/root/download/binaries/kubelogin"



######################################################### IMAGE ########################################################
FROM bash:latest
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

COPY --from=builder "/root/download/kubectl" "/usr/local/bin/kubectl"
COPY --from=builder "/root/download/binaries/kubelogin" "/usr/local/bin/kubelogin"

RUN chmod +x "/usr/local/bin/kubectl" && \
    kubectl version --client=true && \
    kubelogin --version

CMD ["kubectl"]
