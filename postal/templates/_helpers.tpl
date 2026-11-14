{{/*
Expand the name of the chart.
*/}}
{{- define "postal.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "postal.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride }}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 63 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 63 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}


{{/*
Common labels
*/}}
{{- define "postal.labels" -}}
helm.sh/chart: {{ include "postal.chart" . }}
{{ include "postal.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "postal.selectorLabels" -}}
app.kubernetes.io/name: {{ include "postal.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
{{/* Component names preserve the same overrides as the root chart. */}}
{{- define "postal.component.name" -}}
{{- default .root.Chart.Name .values.nameOverride | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{- define "postal.component.fullname" -}}
{{- if .values.fullnameOverride -}}
{{- .values.fullnameOverride | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- $name := default .root.Chart.Name .values.nameOverride -}}
{{- if contains $name .root.Release.Name -}}
{{- .root.Release.Name | trunc 63 | trimSuffix "-" -}}
{{- else -}}
{{- printf "%s-%s" .root.Release.Name $name | trunc 63 | trimSuffix "-" -}}
{{- end -}}
{{- end -}}
{{- end -}}

{{- define "postal.chart" -}}
{{- printf "%s-%s" .Chart.Name .Chart.Version | replace "+" "_" | trunc 63 | trimSuffix "-" -}}
{{- end -}}

{{/* Shared environment references for all Postal application components. */}}
{{- define "postal.environment" -}}
env:
  - name: MAIN_DB_PASSWORD
    valueFrom:
      secretKeyRef:
        name: {{ .Values.global.secretName }}
        key: mariadb-password
  - name: MESSAGE_DB_PASSWORD
    valueFrom:
      secretKeyRef:
        name: {{ .Values.global.secretName }}
        key: mariadb-password
  - name: RAILS_SECRET_KEY
    valueFrom:
      secretKeyRef:
        name: {{ .Values.global.secretName }}
        key: rails-secret-key
envFrom:
  - configMapRef:
      name: {{ include "postal.fullname" . }}
{{- end -}}
