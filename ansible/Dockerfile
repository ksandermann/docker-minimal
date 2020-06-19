######################################################### TOOLCHAIN VERSIONING #########################################

ARG ANSIBLE_VERSION

######################################################### IMAGE ########################################################
FROM python:3.6.9-alpine3.10
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


#shoutout to https://github.com/pyca/cryptography/issues/4264#issuecomment-392781146

#update pip
RUN pip3 install pip --upgrade

#install pip dependencies
RUN pip3 install \
    cryptography \
    pycrypto

#install common requirements separately to have this as a fix image layer and to prevent ansible-lint from updateing ansible
RUN pip3 install \
    ansible-lint \
    hvac \
    jinja2==2.11.2 \
    jmespath \
    netaddr \
    openshift \
    pbr==5.4.5 \
    pip \
    pyOpenSSL \
    pyvmomi

RUN pip3 install \
    ansible==$ANSIBLE_VERSION && \
    ansible --version

WORKDIR /root/project

CMD ["ansible"]
