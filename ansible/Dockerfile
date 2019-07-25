######################################################### TOOLCHAIN VERSIONING #########################################

ARG ANSIBLE_VERSION

######################################################### IMAGE ########################################################
FROM python:3.6.9-alpine3.10
MAINTAINER Kevin Sandermann <kevin.sandermann@gmail.com>
LABEL maintainer="kevin.sandermann@gmail.com"

#update pip
RUN pip3 install pip --upgrade

#install required pip packages
RUN pip3 install wheel setuptools

#install crypthography + required apk packages
#shoutout to https://github.com/pyca/cryptography/issues/4264#issuecomment-392781146
RUN set -e; \
  apk update \
  && apk add --virtual .build-deps gcc python3-dev musl-dev libffi-dev \
  # TODO workaround start
  && apk del libressl-dev \
  && apk add openssl-dev \
  && pip3 install cryptography pycrypto \
  && apk del openssl-dev \
  && apk add libressl-dev \
  # TODO workaround end
  && apk del .build-deps

#install ansible + common requirements
RUN pip3 install \
    ansible-lint \
    ansible==$ANSIBLE_VERSION \
    hvac \
    jinja2==2.10 \
    jmespath \
    netaddr \
    openshift \
    pbr==5.1.1 \
    pip \
    pyOpenSSL \
    pyvmomi && \
    ansible --version

WORKDIR /root/project

CMD ["ansible"]