{{ range $F := .Fields }}
	{{$F.Name}} {{$F.Type}}{{ end }}