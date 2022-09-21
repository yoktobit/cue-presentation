package persistence

{{- range $M := .Models }}
type Create{{$M.Name}} interface {
	Create{{$M.Name}}({{$M.Name}}Record) ({{$M.Name}}Record, error)
}

type {{$M.Name}}Repository interface {
	Create{{$M.Name}}
}

type {{lower $M.Name}}Repository struct{}

func ({{lower $M.Name}}Repository) Create{{$M.Name}}({{lower $M.Name}} {{$M.Name}}Record) ({{$M.Name}}Record, error) {

	{{lower $M.Name}}.Id = 100
	return {{lower $M.Name}}, nil
}

func New{{$M.Name}}Repository() ({{$M.Name}}Repository, error) {

	{{lower $M.Name}}Repository := {{lower $M.Name}}Repository{}
	return {{lower $M.Name}}Repository, nil
}
{{ end }}