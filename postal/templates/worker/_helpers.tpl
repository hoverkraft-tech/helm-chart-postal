{{- define "postal.worker.name" -}}
{{- include "postal.component.name" (dict "root" . "values" .Values.worker) -}}
{{- end -}}

{{- define "postal.worker.fullname" -}}
{{- include "postal.component.fullname" (dict "root" . "values" .Values.worker) -}}
{{- end -}}

{{/*
Common labels
*/}}
{{- define "postal.worker.labels" -}}
helm.sh/chart: {{ include "postal.chart" . }}
{{ include "postal.worker.selectorLabels" . }}
{{- if .Chart.AppVersion }}
app.kubernetes.io/version: {{ .Chart.AppVersion | quote }}
{{- end }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "postal.worker.selectorLabels" -}}
app.kubernetes.io/name: {{ include "postal.worker.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}

{{/*
Create the name of the service account to use
*/}}
{{- define "postal.worker.serviceAccountName" -}}
{{- if .Values.worker.serviceAccount.create }}
{{- default (include "postal.worker.fullname" .) .Values.worker.serviceAccount.name }}
{{- else }}
{{- default "default" .Values.worker.serviceAccount.name }}
{{- end }}
{{- end }}
