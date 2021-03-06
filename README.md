# kube-pod-restarter

This is a small app that can watch for changes on files under a dir and perform
a rollout of a kubernetes deployment. It can be usefull in cases where a restart
is needed because of a secret or configMap update.

## How it works

The app updates an annotation on the specified deployment to trigger a rollout.
The annotation is the sha256sum of all the files under the watched dir under
the key: `uw.systems/<deployment-name>`.

## Environment variables
It expects the following environment variables:
- `DEPLOYMENT_NAME`: the name of the deployment to roll.
- `WATCH_DIR`: the watched directory for changes

## Example

For example this sidecar config would watch for certificate updates under
/etc/matchbox dir:

```
        - name: cert-updater
          image: quay.io/utilitywarehouse/kube-pod-restarter:test
          env:
            - name: DEPLOYMENT_NAME
              value: matchbox
            - name: WATCH_DIR
              value: /etc/matchbox
          volumeMounts:
            - name: config
              mountPath: /etc/matchbox
```
