From docker:stable

MAINTAINER Jimin Huang "huangjimin@whu.edu.cn"


RUN apk add -U openssl curl tar gzip bash ca-certificates git wget jq

RUN curl "https://kubernetes-helm.storage.googleapis.com/helm-v2.7.0-linux-amd64.tar.gz" | tar zx
RUN mv linux-amd64/helm /usr/bin/
RUN helm version --client

RUN curl -L -o /usr/bin/kubectl "https://storage.googleapis.com/kubernetes-release/release/v1.13.8/bin/linux/amd64/kubectl"
RUN chmod +x /usr/bin/kubectl
RUN kubectl version --client
