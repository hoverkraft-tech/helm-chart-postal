{{/*
Expand the name of the chart.
*/}}
{{- define "postal.smtp.name" -}}
{{- default .Chart.Name .Values.smtp.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "postal.smtp.fullname" -}}
{{- if .Values.smtp.fullnameOverride }}
{{- .Values.smtp.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.smtp.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}

{{/*
Create chart name and version as used by the chart label.
*/}}
{{- define "postal.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Common labels
*/}}
{{- define "postal.smtp.labels" -}}
helm.sh/chart: {{ include "postal.chart" . }}
{{ include "postal.smtp.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "postal.smtp.selectorLabels" -}}
app.kubernetes.io/name: {{ include "postal.smtp.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "postal.smtp.serviceAccountName" -}}
{{- if .Values.smtp.serviceAccount.create }}
{{- default (include "postal.smtp.fullname" .) .Values.smtp.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.smtp.serviceAccount.name }}
{{- end }}
{{- end }}
