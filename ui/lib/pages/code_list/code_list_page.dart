import 'dart:html';
import 'dart:convert';
import 'package:file_saver/file_saver.dart';
import 'package:file_saver/file_saver_web.dart';
import 'package:flutter/foundation.dart';
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
  @override
  Widget build(BuildContext context) {
    var form = createDemoCodeList();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Code List'),
      ),
      body: CodeListFormBuilder(
        model: form,
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
                  builder: (context, formArray, child) => DataTable(
                        columns: const [
                          DataColumn(label: Text("Spaltenname")),
                          DataColumn(label: Text("Beschreibung")),
                        ],
                        rows: formModel.definitionForm.columnsCodeColumnForm
                            .map(
                              (column) => DataRow(
                                cells: [
                                  DataCell(
                                    ReactiveTextField(
                                      formControl: column.nameControl,
                                      decoration: const InputDecoration(),
                                    ),
                                  ),
                                  DataCell(
                                    ReactiveTextField(
                                      formControl: column.labelControl,
                                      decoration: const InputDecoration(),
                                    ),
                                  ),
                                ],
                              ),
                            )
                            .toList(),
                      )),
              ReactiveCodeListFormConsumer(
                builder: (context, formGroup, child) => ElevatedButton(
                    onPressed: () => gotoData(formGroup),
                    child: const Text("Daten bearbeiten")),
              ),
              ReactiveFormConsumer(
                builder: (context, formGroup, child) => ElevatedButton(
                  onPressed: formGroup.dirty ? () => send(formGroup) : null,
                  child: const Text("Speichern"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void send(FormGroup form) {
    if (kDebugMode) {
      print("Huhu");
      print(jsonEncode(form.value));
    }
    setState(() {
      form.markAsPristine();
    });
    FileSaver.instance.saveFile(
        "test", Uint8List.fromList(jsonEncode(form.value).codeUnits), "json",
        mimeType: MimeType.JSON);
  }

  void download(FormGroup form) {
    print(jsonEncode(form));
  }

  gotoData(CodeListForm form) {
    send(form.form);
    Navigator.pushNamed(context, '/codelistdata', arguments: form);
  }
}
