# <img src=".github/logo.svg" width="56" alt="" /> Postal Helm Chart

Deploy the Postal email delivery platform on Kubernetes, including web, SMTP and worker components.

[![Continuous Integration](https://github.com/hoverkraft-tech/helm-chart-postal/actions/workflows/main-ci.yml/badge.svg)](https://github.com/hoverkraft-tech/helm-chart-postal/actions/workflows/main-ci.yml)
[![Release](https://img.shields.io/github/v/release/hoverkraft-tech/helm-chart-postal)](https://github.com/hoverkraft-tech/helm-chart-postal/releases)
[![PRs welcome](https://img.shields.io/badge/PRs-welcome-brightgreen)](docs/development/linting.md)

## Prerequisites

A Kubernetes cluster, a configured kubectl context and Helm with OCI registry support. Prepare Postal domains, credentials, database settings and SMTP networking in your values file.

## Install

Review the [chart values](postal/values.yaml), save your settings in `my-values.yaml`,
then install a published chart:

```sh
helm upgrade --install postal oci://ghcr.io/hoverkraft-tech/helm-chart-postal/charts/postal/helm-chart-postal \
  --namespace postal --create-namespace \
  --values my-values.yaml
```

See [usage and configuration](docs/usage/installation.md) for more details.

## Contributing

Open an issue or pull request to discuss changes. The [contributor guide](docs/development/linting.md)
describes the dev container and local lint commands.

## Maintainer

Maintained by [Hoverkraft](https://hoverkraft.cloud).

## License

This repository does not currently provide a top-level license.
Bundled third-party code retains its own license.
