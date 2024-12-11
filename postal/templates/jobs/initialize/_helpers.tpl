{{/*
Expand the name of the chart.
*/}}
{{- define "postal.jobs.initialize.name" -}}
{{- default .Chart.Name .Values.jobs.initialize.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "postal.jobs.initialize.fullname" -}}
{{- if .Values.jobs.initialize.fullnameOverride }}
{{- .Values.jobs.initialize.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.jobs.initialize.nameOverride }}
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
{{- define "postal.jobs.initialize.labels" -}}
helm.sh/chart: {{ include "postal.chart" . }}
{{ include "postal.jobs.initialize.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "postal.jobs.initialize.selectorLabels" -}}
app.kubernetes.io/name: {{ include "postal.jobs.initialize.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "postal.jobs.initialize.serviceAccountName" -}}
{{- if .Values.jobs.initialize.serviceAccount.create }}
{{- default (include "postal.jobs.initialize.fullname" .) .Values.jobs.initialize.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.jobs.initialize.serviceAccount.name }}
{{- end }}
{{- end }}
