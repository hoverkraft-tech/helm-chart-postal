{{- define "postal.web.name" -}}
{{- include "postal.component.name" (dict "root" . "values" .Values.web) -}}
{{- end -}}

{{- define "postal.web.fullname" -}}
{{- include "postal.component.fullname" (dict "root" . "values" .Values.web) -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "postal.web.labels" -}}
helm.sh/chart: {{ include "postal.chart" . }}
{{ include "postal.web.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "postal.web.selectorLabels" -}}
app.kubernetes.io/name: {{ include "postal.web.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "postal.web.serviceAccountName" -}}
{{- if .Values.web.serviceAccount.create }}
{{- default (include "postal.web.fullname" .) .Values.web.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.web.serviceAccount.name }}
{{- end }}
{{- end }}
