import 'dart:html';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test1/examples/demo_data.dart';
import 'package:test1/model/code_list.dart';
import 'package:test1/services/sending_service.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CodeListPage extends StatefulWidget {
  final CodeList codeList;

  const CodeListPage({Key? key, required this.codeList}) : super(key: key);

  @override
  State<CodeListPage> createState() => _CodeListPageState();
}

class _CodeListPageState extends State<CodeListPage> {
  FormGroup form = FormGroup(
    {
      "name": FormControl(),
      "label": FormControl(),
    },
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code List'),
      ),
      body: CodeListFormBuilder(
        model: createDemoCodeList(),
        builder: (context, formModel, child) => Card(
          child: Column(
            children: [
              ReactiveTextField(
                formControl: formModel.definitionForm.nameControl,
                decoration: const InputDecoration(
                  labelText: "Name",
                ),
              ),
              ReactiveTextField(
                formControl: formModel.definitionForm.labelControl,
                decoration: const InputDecoration(
                  labelText: "Label",
                ),
              ),
              ReactiveFormArray(
                formArray: formModel.definitionForm.columnsControl,
                builder: (context, formArray, child) => Column(
                  children: formModel.definitionForm.columnsControl!.value!
                      .asMap()
                      .map((key, value) {
                        return MapEntry(
                            key,
                            ReactiveTextField(
                              formControlName: "$key.name",
                            ));
                      })
                      .values
                      .toList(),
                ),
              ),
              ReactiveFormConsumer(
                builder: (context, formGroup, child) => ElevatedButton(
                  onPressed: () => send(formGroup),
                  child: const Text("Absenden"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void send(FormGroup form) {
    print(form.rawValue);
  }
}
