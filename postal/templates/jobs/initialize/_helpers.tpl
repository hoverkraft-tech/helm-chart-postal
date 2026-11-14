{{- define "postal.jobs.initialize.name" -}}
{{- include "postal.component.name" (dict "root" . "values" .Values.jobs.initialize) -}}
{{- end -}}

{{- define "postal.jobs.initialize.fullname" -}}
{{- include "postal.component.fullname" (dict "root" . "values" .Values.jobs.initialize) -}}
{{- end -}}

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
