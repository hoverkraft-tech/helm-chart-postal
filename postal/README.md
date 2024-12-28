# postal

![Version: 0.1.3](https://img.shields.io/badge/Version-0.1.3-informational?style=flat-square) ![Type: application](https://img.shields.io/badge/Type-application-informational?style=flat-square) ![AppVersion: 3.3.4](https://img.shields.io/badge/AppVersion-3.3.4-informational?style=flat-square)

A Helm chart for Kubernetes

## Maintainers

| Name | Email | Url |
| ---- | ------ | --- |
| libr4rian |  |  |
| webofmars | <contact@webofmars.com> |  |
| escemi | <contact@escemi.com> |  |

## Requirements

| Repository | Name | Version |
|------------|------|---------|
| https://charts.bitnami.com/bitnami | mariadb | 16.*.* |

## Values

| Key | Type | Default | Description |
|-----|------|---------|-------------|
| clamAv.enabled | bool | `false` |  |
| clamAv.host | string | `""` |  |
| clamAv.port | int | `2000` |  |
| commonsAnnotations | object | `{}` |  |
| database.encoding | string | `"utf8mb4"` |  |
| database.poolSize | int | `5` |  |
| dns.mxRecords | string | `""` |  |
| dns.returnPathDomain | string | `""` |  |
| dns.routeDomain | string | `""` |  |
| dns.spfInclude | string | `""` |  |
| dns.trackDomain | string | `""` |  |
| fullnameOverride | string | `""` |  |
| global.existingSecretName | string | `""` |  |
| global.maximumDeliveryAttempts | int | `18` |  |
| global.maximumHoldExpiryDays | int | `7` |  |
| global.secretName | string | `"postal"` |  |
| global.smtpHostname | string | `"localhost"` |  |
| global.smtpRelays | string | `""` |  |
| global.spamFailureThreshold | int | `20` |  |
| global.spamThreshold | int | `5` |  |
| global.suppressionListAutomaticRemovalDays | int | `30` |  |
| global.trustedProxies | string | `""` |  |
| global.useIpPools | bool | `false` |  |
| global.useLocalNsForDomainVerification | bool | `false` |  |
| global.useResentSenderHeader | bool | `true` |  |
| global.webHostname | string | `"localhost"` |  |
| global.webProtocol | string | `"http"` |  |
| image.pullPolicy | string | `"IfNotPresent"` |  |
| image.repository | string | `"ghcr.io/postalserver/postal"` |  |
| image.tag | string | `""` |  |
| jobs.initialize.affinity | object | `{}` |  |
| jobs.initialize.autoscaling.enabled | bool | `false` |  |
| jobs.initialize.autoscaling.maxReplicas | int | `100` |  |
| jobs.initialize.autoscaling.minReplicas | int | `1` |  |
| jobs.initialize.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| jobs.initialize.enable | bool | `true` |  |
| jobs.initialize.fullnameOverride | string | `"postal-initialize"` |  |
| jobs.initialize.image.pullPolicy | string | `"IfNotPresent"` |  |
| jobs.initialize.image.repository | string | `"ghcr.io/postalserver/postal"` |  |
| jobs.initialize.image.tag | string | `""` |  |
| jobs.initialize.imagePullSecrets | list | `[]` |  |
| jobs.initialize.nameOverride | string | `"postal-initialize"` |  |
| jobs.initialize.nodeSelector | object | `{}` |  |
| jobs.initialize.podAnnotations | object | `{}` |  |
| jobs.initialize.podSecurityContext | object | `{}` |  |
| jobs.initialize.resources | object | `{}` |  |
| jobs.initialize.securityContext | object | `{}` |  |
| jobs.initialize.serviceAccount.annotations | object | `{}` |  |
| jobs.initialize.serviceAccount.create | bool | `false` |  |
| jobs.initialize.serviceAccount.name | string | `""` |  |
| jobs.initialize.tolerations | list | `[]` |  |
| logging.enabled | bool | `true` |  |
| logging.highlighting | bool | `false` |  |
| logging.railsLog | bool | `false` |  |
| logging.sentryDsn | string | `""` |  |
| mariadb.auth.database | string | `"postal"` |  |
| mariadb.auth.password | string | `"postal"` |  |
| mariadb.auth.username | string | `"postal"` |  |
| mariadb.enabled | bool | `true` |  |
| mariadb.fullnameOverride | string | `"postal-mariadb"` |  |
| mariadb.initdbScripts."grant_privileges.sql" | string | `"GRANT ALL PRIVILEGES ON `postal%`.* TO 'postal'@'%' WITH GRANT OPTION;\n"` |  |
| nameOverride | string | `""` |  |
| smtp.affinity | object | `{}` |  |
| smtp.containerPort | int | `25` |  |
| smtp.fullnameOverride | string | `"postal-smtp"` |  |
| smtp.healthAndMetricsServerPort | int | `9090` |  |
| smtp.imagePullSecrets | list | `[]` |  |
| smtp.logConnections | bool | `false` |  |
| smtp.logIpAddressExclusionMatcher | string | `""` |  |
| smtp.maxMessageSize | int | `14` |  |
| smtp.nameOverride | string | `"postal-smtp"` |  |
| smtp.nodeSelector | object | `{}` |  |
| smtp.podAnnotations | object | `{}` |  |
| smtp.podSecurityContext | object | `{}` |  |
| smtp.proxyProtocol | bool | `false` |  |
| smtp.replicaCount | int | `1` |  |
| smtp.resources | object | `{}` |  |
| smtp.securityContext | object | `{}` |  |
| smtp.service.port | int | `25` |  |
| smtp.service.type | string | `"ClusterIP"` |  |
| smtp.serviceAccount.annotations | object | `{}` |  |
| smtp.serviceAccount.create | bool | `false` |  |
| smtp.serviceAccount.name | string | `""` |  |
| smtp.tls.enabled | bool | `false` |  |
| smtp.tolerations | list | `[]` |  |
| spamAssassin.enabled | bool | `false` |  |
| spamAssassin.host | string | `""` |  |
| spamAssassin.port | int | `783` |  |
| web.affinity | object | `{}` |  |
| web.autoscaling.enabled | bool | `false` |  |
| web.autoscaling.maxReplicas | int | `100` |  |
| web.autoscaling.minReplicas | int | `1` |  |
| web.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| web.containerPort | int | `5000` |  |
| web.fullnameOverride | string | `"postal-web"` |  |
| web.imagePullSecrets | list | `[]` |  |
| web.ingress.annotations | object | `{}` |  |
| web.ingress.className | string | `""` |  |
| web.ingress.enabled | bool | `false` |  |
| web.ingress.hosts[0].host | string | `"chart-example.local"` |  |
| web.ingress.hosts[0].paths[0].path | string | `"/"` |  |
| web.ingress.hosts[0].paths[0].pathType | string | `"ImplementationSpecific"` |  |
| web.ingress.tls | list | `[]` |  |
| web.maxThreads | int | `5` |  |
| web.nameOverride | string | `"postal-web"` |  |
| web.nodeSelector | object | `{}` |  |
| web.podAnnotations | object | `{}` |  |
| web.podSecurityContext | object | `{}` |  |
| web.replicaCount | int | `1` |  |
| web.resources | object | `{}` |  |
| web.securityContext | object | `{}` |  |
| web.service.port | int | `80` |  |
| web.service.type | string | `"ClusterIP"` |  |
| web.serviceAccount.annotations | object | `{}` |  |
| web.serviceAccount.create | bool | `false` |  |
| web.serviceAccount.name | string | `""` |  |
| web.tolerations | list | `[]` |  |
| worker.affinity | object | `{}` |  |
| worker.autoscaling.enabled | bool | `false` |  |
| worker.autoscaling.maxReplicas | int | `100` |  |
| worker.autoscaling.minReplicas | int | `1` |  |
| worker.autoscaling.targetCPUUtilizationPercentage | int | `80` |  |
| worker.fullnameOverride | string | `"postal-worker"` |  |
| worker.healthAndMetricsServerPort | int | `9090` |  |
| worker.imagePullSecrets | list | `[]` |  |
| worker.nameOverride | string | `"postal-worker"` |  |
| worker.nodeSelector | object | `{}` |  |
| worker.podAnnotations | object | `{}` |  |
| worker.podSecurityContext | object | `{}` |  |
| worker.replicaCount | int | `1` |  |
| worker.resources | object | `{}` |  |
| worker.securityContext | object | `{}` |  |
| worker.service.type | string | `"ClusterIP"` |  |
| worker.serviceAccount.annotations | object | `{}` |  |
| worker.serviceAccount.create | bool | `false` |  |
| worker.serviceAccount.name | string | `""` |  |
| worker.tolerations | list | `[]` |  |

----------------------------------------------
Autogenerated from chart metadata using [helm-docs v1.14.2](https://github.com/norwoodj/helm-docs/releases/v1.14.2)
