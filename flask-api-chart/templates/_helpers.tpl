{{- define "flaskapp.labels" -}}
app: flaskapp
env: {{ .Values.app.env }}
{{- end -}}