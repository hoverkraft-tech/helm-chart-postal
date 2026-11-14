# Installation and configuration

## Published charts

The chart is published at `oci://ghcr.io/hoverkraft-tech/helm-chart-postal/charts/postal/helm-chart-postal`.
Choose a version from the [releases](https://github.com/hoverkraft-tech/helm-chart-postal/releases)
and add `--version <chart-version>` when you need a reproducible deployment.

The [chart reference](../../postal/README.md) and
[values file](../../postal/values.yaml) describe the supported configuration.
Keep secrets outside Git and protect any local values file containing credentials.

## Install from source

From the repository root:

```sh
helm dependency build postal
helm upgrade --install postal ./postal \
  --namespace postal --create-namespace \
  --values my-values.yaml
```
