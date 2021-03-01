{{/*
Create a default fully qualified app name.
We truncate at 63 chars because some Kubernetes name fields are limited to this (by the DNS naming spec).
If release name contains chart name it will be used as a full name.
*/}}
{{- define "template.fullname" -}}
{{- if .Values.fullnameOverride }}
{{- .Values.fullnameOverride | trunc 15 | trimSuffix "-"}}
{{- else }}
{{- $name := default .Chart.Name .Values.nameOverride}}
{{- if contains $name .Release.Name }}
{{- .Release.Name | trunc 15 | trimSuffix "-" }}
{{- else }}
{{- printf "%s-%s" .Release.Name $name | trunc 15 | trimSuffix "-" }}
{{- end }}
{{- end }}
{{- end }}
