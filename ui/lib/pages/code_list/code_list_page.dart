import 'dart:convert';

import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test1/model/code_list.dart';
import 'package:test1/pages/start/navigation_bar.dart';

class CodeListPage extends StatefulWidget {
  final CodeList codeList;

  const CodeListPage({Key? key, required this.codeList}) : super(key: key);

  @override
  State<CodeListPage> createState() => _CodeListPageState();
}

class _CodeListPageState extends State<CodeListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code-Liste ${widget.codeList.definition?.name}'),
        actions: [
          CodeListFormBuilder(
              model: widget.codeList,
              builder: (context, formModel, child) =>
                  ReactiveCodeListFormConsumer(
                    builder: (context, formModel, child) => IconButton(
                      onPressed: () => send(formModel),
                      icon: const Icon(Icons.save_outlined),
                      padding: kDebugMode
                          ? const EdgeInsetsDirectional.only(end: 50)
                          : const EdgeInsets.all(8),
                    ),
                  ))
        ],
      ),
      body: CodeListFormBuilder(
        model: widget.codeList,
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
              const Divider(),
              ReactiveCodeListFormConsumer(
                builder: (context, formGroup, child) => ElevatedButton(
                  onPressed: () => gotoData(formGroup),
                  child: const Text("Daten bearbeiten"),
                ),
              ),
              const Divider(),
              ReactiveCodeListFormConsumer(
                builder: (context, codeListForm, child) => ElevatedButton(
                  onPressed: () => send(codeListForm),
                  child: const Text("Speichern"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void send(CodeListForm codeListForm) {
    if (kDebugMode) {
      print("Huhu");
      print(jsonEncode(widget.codeList));
      print(codeListForm.model.definition?.name);
      print(codeListForm.definitionForm.nameControlPath());
    }
    //codeListForm.updateValue(CodeList.fromForm(codeListForm));
    FileSaver.instance.saveFile("test",
        Uint8List.fromList(jsonEncode(codeListForm.model).codeUnits), "json",
        mimeType: MimeType.JSON);
  }

  void download(FormGroup form) {
    if (kDebugMode) {
      print(jsonEncode(form));
    }
  }

  gotoData(CodeListForm form) {
    Navigator.pushNamed(context, '/codelistdata', arguments: form).then(
      (map) {
        final codeListFormMap = map as Map<String, CodeListForm>;
        if (kDebugMode) {
          print(codeListFormMap["form"]?.codeList?.data?.rows?.last.value);
          print((codeListFormMap["form"]?.form.control("data") as FormArray)
              .rawValue);
        }
        setState(() {});
      },
    );
  }
}
