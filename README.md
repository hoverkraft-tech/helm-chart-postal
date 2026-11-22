# <img src=".github/logo.svg" width="56" alt="" /> Postal Helm Chart

[![Continuous Integration](https://github.com/hoverkraft-tech/helm-chart-postal/actions/workflows/main-ci.yml/badge.svg)](https://github.com/hoverkraft-tech/helm-chart-postal/actions/workflows/main-ci.yml)
[![Release](https://img.shields.io/github/v/release/hoverkraft-tech/helm-chart-postal)](https://github.com/hoverkraft-tech/helm-chart-postal/releases)

Deploy Postal on Kubernetes with Helm.

## Prerequisites

- Kubernetes cluster with a configured kubectl context
- Helm with OCI support
- Postal runtime configuration prepared in your values file

## Install

```sh
helm upgrade --install postal oci://ghcr.io/hoverkraft-tech/helm-chart-postal/charts/postal/helm-chart-postal \
  --namespace postal --create-namespace \
  --values my-values.yaml
```

## Local checks

```sh
make lint
```

## Contributing

Open an issue or pull request.
