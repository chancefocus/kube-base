From docker:stable

MAINTAINER Jimin Huang "huangjimin@whu.edu.cn"


RUN apk add -U openssl curl tar gzip bash ca-certificates git wget jq
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://alpine-pkgs.sgerrand.com/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.29-r0/glibc-2.29-r0.apk
RUN apk add glibc-2.29-r0.apk

RUN curl "https://kubernetes-helm.storage.googleapis.com/helm-v2.14.1-linux-amd64.tar.gz" | tar zx
RUN mv linux-amd64/helm /usr/bin/
RUN mv linux-amd64/tiller /usr/bin
RUN helm version --client
RUN tiller -version

RUN curl -L -o /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v1.13.8/bin/linux/amd64/kubectl"
RUN chmod +x /usr/bin/kubectl
RUN kubectl version --client
