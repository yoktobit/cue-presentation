package router

{{ range $R := .Routes }}

type {{$R.Name}}Input struct {
	{{ range $F := $R.Input.Fields }}
	{{$F.Name}} {{$F.Type}}{{ end }}
}

type {{$R.Name}}Output struct {
	{{ range $F := $R.Output.Fields }}
	{{$F.Name}} {{$F.Type}}{{ end }}
}

{{ end }}