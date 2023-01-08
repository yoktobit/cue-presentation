import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test1/model/code_column.dart';
import 'package:test1/model/code_list.dart';

class CodeDefinitionPage extends StatefulWidget {
  final CodeListForm codeListForm;
  const CodeDefinitionPage({super.key, required this.codeListForm});

  @override
  State<StatefulWidget> createState() => _CodeDefinitionPageState();
}

class _CodeDefinitionPageState extends State<CodeDefinitionPage> {
  late CodeListForm codeListForm;

  @override
  void initState() {
    codeListForm = widget.codeListForm;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            "Spaltendefinition für ${codeListForm.definitionForm.nameControl.value}"),
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: onAddPressed, child: const Icon(Icons.add)),
      body: ReactiveForm(
        formGroup: codeListForm.form,
        child: WillPopScope(
          onWillPop: () async => onBack(codeListForm),
          child: Column(
            children: [
              ReactiveFormArray(
                formArray: codeListForm.definitionForm.columnsControl,
                builder: (context, formArray, child) => SingleChildScrollView(
                  child: DataTable(
                    columns: const [
                      DataColumn(label: Text("Spaltenname")),
                      DataColumn(label: Text("Beschreibung")),
                    ],
                    rows: codeListForm.definitionForm.columnsCodeColumnForm
                        .map(
                          (column) => DataRow(
                            cells: [
                              DataCell(
                                ReactiveTextField(
                                  autofocus: true,
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
                  ),
                ),
              ),
              const Divider(),
              ElevatedButton(
                  onPressed: () => send(context),
                  child: const Text("Speichern und zurück"))
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onBack(CodeListForm codeListForm) async {
    if (kDebugMode) {
      print("Popped out of CodeDefinitionPage");
    }
    Navigator.pop(context, {'form': codeListForm});
    return true;
  }

  void send(BuildContext context) {
    if (kDebugMode) {
      print(codeListForm.form.rawValue);
    }
    Navigator.pop(context, {'form': codeListForm});
  }

  void onAddPressed() {
    setState(() {
      codeListForm.definitionForm
          .addColumnsItem(CodeColumn(name: "", label: ""));
    });
  }
}
