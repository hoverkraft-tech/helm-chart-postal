FROM ghcr.io/hoverkraft-tech/docker-base-images/super-linter:2.0.2@sha256:12dedee667b43856a9cc792628fecc4723fc0868bf8090d268981407a7402b2c AS linter

# CRD definitions have no published Kubeconform schema; chart-testing installs them.
ENV KUBERNETES_KUBECONFORM_OPTIONS="-skip CustomResourceDefinition -schema-location default -schema-location https://raw.githubusercontent.com/hoverkraft-tech/crds-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json -schema-location https://raw.githubusercontent.com/datreeio/CRDs-catalog/main/{{.Group}}/{{.ResourceKind}}_{{.ResourceAPIVersion}}.json"

HEALTHCHECK --interval=5m --timeout=10s --start-period=30s --retries=3 CMD ["/bin/sh", "-c", "test -d /github/home"]
ARG UID=1000
ARG GID=1000
USER ${UID}:${GID}
