import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test1/model/code_list.dart';

class CodeListDataPage extends StatefulWidget {
  final CodeListForm form;

  const CodeListDataPage({Key? key, required this.form}) : super(key: key);

  @override
  State<CodeListDataPage> createState() => _CodeListDataPageState();
}

class _CodeListDataPageState extends State<CodeListDataPage> {
  @override
  void initState() {
    var form = widget.form;
    if (form.model.definition != null) {
      form.form.addAll({
        "data": FormArray(form.model.data?.rows
                ?.map((row) => FormGroup({
                      ...{"selected": FormControl(value: row.selected)},
                      ...Map.fromEntries(form.model.definition?.columns
                              ?.map((column) => MapEntry(column.name,
                                  FormControl(value: row.value?[column.name])))
                              .toList() ??
                          [])
                    }))
                .toList() ??
            [])
      });
      if (kDebugMode) {
        print(form.form.rawValue);
      }
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var form = widget.form;
    return Scaffold(
      appBar: AppBar(
        title: Text('Code List ${form.model.definition?.label}'),
      ),
      body: ReactiveForm(
        formGroup: form.form,
        child: Card(
          child: Column(
            children: [
              ReactiveFormArray(
                  formArrayName: "data",
                  builder: (context, formArray, child) => DataTable(
                        columns: form.definitionForm.columnsCodeColumnForm
                            .map((column) => DataColumn(
                                  label: Text(column.labelControl.value ?? ""),
                                ))
                            .toList(),
                        rows: (form.form.controls["data"] as FormArray?)
                                ?.controls
                                .map((control) => control as FormGroup)
                                .map(
                                  (row) => DataRow(
                                      selected: row.control("selected").value,
                                      onSelectChanged: (bool? value) {
                                        setState(() {
                                          (row.control("selected")
                                              as FormControl)
                                            ..updateValue(value)
                                            ..markAsDirty();
                                        });
                                      },
                                      cells: form
                                          .definitionForm.columnsCodeColumnForm
                                          .map(
                                            (column) => DataCell(
                                              ReactiveTextField(
                                                formControl: row.control(column
                                                    .nameControl
                                                    .value!) as FormControl,
                                                decoration: InputDecoration(
                                                    hintText: column
                                                        .labelControl.value),
                                              ),
                                            ),
                                          )
                                          .toList()),
                                )
                                .toList() ??
                            [],
                      )),
              const Divider(),
              ReactiveFormConsumer(
                builder: (context, formGroup, child) => ElevatedButton(
                  onPressed: formGroup.dirty ? () => send(formGroup) : null,
                  child: const Text("Speichern und zurück"),
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
      print(form.rawValue);
    }
    Navigator.pop(context);
  }
}
