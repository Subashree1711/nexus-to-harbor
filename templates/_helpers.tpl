{{/*
Expand the name of the chart.
*/}}
{{- define "nexus-to-edge.name" -}}
{{- default .Chart.Name .Values.nameOverride | trunc 63 | trimSuffix "-" }}
{{- end }}

{{/*
Create a default fully qualified app name.
*/}}
{{- define "nexus-to-edge.fullname" -}}
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
{{- define "nexus-to-edge.labels" -}}
helm.sh/chart: {{ include "nexus-to-edge.name" . }}
{{ include "nexus-to-edge.selectorLabels" . }}
app.kubernetes.io/managed-by: {{ .Release.Service }}
{{- end }}

{{/*
Selector labels
*/}}
{{- define "nexus-to-edge.selectorLabels" -}}
app.kubernetes.io/name: {{ include "nexus-to-edge.name" . }}
app.kubernetes.io/instance: {{ .Release.Name }}
{{- end }}
