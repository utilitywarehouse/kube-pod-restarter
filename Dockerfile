FROM alpine:3.13

ENV KUBECTL_VERSION=v1.21.0
RUN apk add --no-cache curl &&\
  curl -Ls -o /usr/local/bin/kubectl https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl &&\
  chmod +x /usr/local/bin/kubectl

COPY kube-pod-restarter /kube-pod-restarter
COPY reload /reload

ENTRYPOINT ["/kube-pod-restarter"]
