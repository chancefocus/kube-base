From docker:stable

MAINTAINER Jimin Huang "huangjimin@whu.edu.cn"


RUN apk add -U openssl curl tar gzip bash ca-certificates git wget jq
RUN wget -q -O /etc/apk/keys/sgerrand.rsa.pub https://raw.githubusercontent.com/sgerrand/alpine-pkg-glibc/master/sgerrand.rsa.pub
RUN wget https://github.com/sgerrand/alpine-pkg-glibc/releases/download/2.23-r3/glibc-2.23-r3.apk
RUN apk add glibc-2.23-r3.apk
RUN rm glibc-2.23-r3.apk

RUN curl "https://kubernetes-helm.storage.googleapis.com/helm-v${HELM_VERSION}-linux-amd64.tar.gz" | tar zx
RUN mv linux-amd64/helm /usr/bin/
RUN helm version --client

RUN curl -L -o /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v${KUBERNETES_VERSION}/bin/linux/amd64/kubectl"
RUN chmod +x /usr/bin/kubectl
RUN kubectl version --client
