######################################################### TOOLCHAIN VERSIONING #########################################

ARG ANSIBLE_VERSION

######################################################### IMAGE ########################################################
FROM python:3.10.6-alpine3.16
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

ARG ANSIBLE_VERSION

#install general requirements
RUN apk update && \
    apk add \
    gcc \
    libffi-dev \
    libressl-dev \
    make \
    musl-dev \
    openssl-dev \
    python3-dev

#install common requirements separately to have this as a fix image layer and to prevent ansible-lint from updating ansible
RUN pip3 install \
    ansible-lint \
    cryptography \
    hvac \
    jinja2==3.1.2 \
    jmespath \
    netaddr \
    pbr \
    pycrypto \
    pyOpenSSL \
    pyvmomi

RUN pip3 install \
    ansible==$ANSIBLE_VERSION && \
    ansible --version

WORKDIR /root/project

CMD ["ansible"]
