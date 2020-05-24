FROM alpine:3.8

ARG KUSTOMIZE_VERSION=v3.6.0

RUN apk add --update ca-certificates git \
 && apk add --update -t deps curl \
 && curl -L https://github.com/kubernetes-sigs/kustomize/releases/download/kustomize/${KUSTOMIZE_VERSION}/kustomize_${KUSTOMIZE_VERSION}_linux_amd64.tar.gz | \
    tar -xz -C /usr/local/bin \
 && apk del --purge deps \
 && rm /var/cache/apk/*

ENTRYPOINT ["kustomize"]
CMD ["help"]
