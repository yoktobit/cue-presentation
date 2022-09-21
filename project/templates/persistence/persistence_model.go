package persistence

{{- range $M := .Models }}
type {{$M.Name}}Record struct {
	Id int64
	{{- template "fields.go" $M }}
}
{{ end }}