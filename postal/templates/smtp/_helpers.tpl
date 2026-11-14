{{- define "postal.smtp.name" -}}
{{- include "postal.component.name" (dict "root" . "values" .Values.smtp) -}}
{{- end -}}

{{- define "postal.smtp.fullname" -}}
{{- include "postal.component.fullname" (dict "root" . "values" .Values.smtp) -}}
{{- end -}}

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
