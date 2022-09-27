import 'dart:html';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test1/services/sending_service.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
{{ range $S := .Page.Steps }}
import 'steps/step_{{ lower $S.Name }}.dart';
{{ end }}

class {{.Page.Name}}Page extends StatefulWidget {
  final SendingService sendingService;
  const {{.Page.Name}}Page(final this.sendingService, {Key? key}) : super(key: key);

  @override
  State<{{.Page.Name}}Page> createState() => _{{.Page.Name}}PageState();
}

class _{{.Page.Name}}PageState extends State<{{.Page.Name}}Page> {
  int _step = 0;
  static const int stepCount = {{len .Page.Steps}};
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('{{ .Page.Label }}'),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Stepper(
          onStepContinue: stepContinue,
          currentStep: _step,
          steps: const [
            {{ range $S := .Page.Steps }}
            Step(
              title: Text('{{ $S.Name }}'),
              content: {{ $S.Name }}StepContent(),
            ),
            {{ end }}
          ],
        ),
      ),
    );
  }

  stepContinue() {
    if (_step < stepCount - 1) {
      setState(() {
        _step++;
      });
    } else {
      final data = {
        {{- range $S := .Page.Steps -}}
        {{- range $F := $S.Fields -}}
        '{{$F.Name}}': _formKey.currentState?.fields['{{lower $F.Name}}']?.transformedValue,
        {{- end}}
        {{- end -}}
      };
      final json = jsonEncode(data);
      widget.sendingService.send("{{- .Page.Endpoint.Path -}}", json);
      Navigator.pushNamed(context, '/sent');
    }
  }
}
