import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test1/model/code_data.dart';
import 'package:test1/model/code_list.dart';
import 'package:test1/model/code_row.dart';

class CodeListDataPage extends StatefulWidget {
  final CodeListForm form;

  const CodeListDataPage({Key? key, required this.form}) : super(key: key);

  @override
  State<CodeListDataPage> createState() => _CodeListDataPageState();
}

class _CodeListDataPageState extends State<CodeListDataPage> {
  late CodeListForm codelistForm;

  @override
  void initState() {
    codelistForm = widget.form;
    if (codelistForm.definitionForm.isSingleRecordControl.value == true) {
      if (!codelistForm.form.contains("data")) {
        codelistForm.form.addAll({
          "data": FormArray([CodeRow()]
              .map((row) => FormGroup({
                    "selected": FormControl(value: row.selected),
                    "value": FormGroup(
                      Map.fromEntries(codelistForm.model.definition?.columns
                              ?.map((column) => MapEntry(column.name,
                                  FormControl(value: row.value?[column.name])))
                              .toList() ??
                          []),
                    )
                  }))
              .toList()),
        });
      }
    } else {
      codelistForm.form.addAll({
        "data": FormArray(codelistForm.model.data?.rows
                ?.map((row) => FormGroup({
                      ...{"selected": FormControl(value: row.selected)},
                      "value": FormGroup(
                        Map.fromEntries(codelistForm.model.definition?.columns
                                ?.map((column) => MapEntry(
                                    column.name,
                                    FormControl(
                                        value: row.value?[column.name])))
                                .toList() ??
                            []),
                      )
                    }))
                .toList() ??
            [])
      });
    }

    if (kDebugMode) {
      print(codelistForm.form.rawValue);
    }

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Code List ${codelistForm.model.definition?.label}'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onAddPressed,
        child: const Icon(Icons.add),
      ),
      body: ReactiveForm(
        formGroup: codelistForm.form,
        child: WillPopScope(
          onWillPop: () async => onBack(codelistForm),
          child: Card(
            child: Column(
              children: [
                ReactiveFormArray(
                    formArrayName: "data",
                    builder: (context, formArray, child) => (codelistForm
                                .definitionForm.isSingleRecordControl.value ==
                            false
                        ? DataTable(
                            columns: codelistForm
                                .definitionForm.columnsCodeColumnForm
                                .map((column) => DataColumn(
                                      label:
                                          Text(column.labelControl.value ?? ""),
                                    ))
                                .toList(),
                            rows: (codelistForm.form.controls["data"]
                                        as FormArray?)
                                    ?.controls
                                    .map((control) => control as FormGroup)
                                    .map(
                                      (row) => DataRow(
                                          selected:
                                              row.control("selected").value,
                                          onSelectChanged: (bool? value) {
                                            setState(() {
                                              (row.control("selected")
                                                  as FormControl)
                                                ..updateValue(value)
                                                ..markAsDirty();
                                            });
                                          },
                                          cells: codelistForm.definitionForm
                                              .columnsCodeColumnForm
                                              .map((column) {
                                            return DataCell(
                                              placeholder: true,
                                              ReactiveTextField(
                                                formControl: (row.control(
                                                        "value") as FormGroup)
                                                    .control(column.nameControl
                                                        .value!) as FormControl,
                                                decoration: InputDecoration(
                                                    hintText: column
                                                        .labelControl.value),
                                              ),
                                              //onTap: () => focusNode.requestFocus(),
                                            );
                                          }).toList()),
                                    )
                                    .toList() ??
                                [],
                          )
                        : Column(
                            children: codelistForm
                                .definitionForm.columnsCodeColumnForm
                                .map(
                                  (column) => Padding(
                                    padding: const EdgeInsets.all(20),
                                    child: ReactiveTextField(
                                      formControl: ((formArray.controls.first
                                                  as FormGroup)
                                              .control("value") as FormGroup)
                                          .control(column.nameControl
                                              .value!) as FormControl,
                                      decoration: InputDecoration(
                                          labelText: column.labelControl.value),
                                    ),
                                  ),
                                )
                                .toList(),
                          ))),
                const Divider(),
                ReactiveFormConsumer(
                  builder: (context, formGroup, child) => ElevatedButton(
                    onPressed: formGroup.dirty ? () => send() : null,
                    child: const Text("Speichern und zurück"),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<bool> onBack(CodeListForm codeList) async {
    if (kDebugMode) {
      print("Popped out of ListPage");
    }
    codelistForm.codeList?.data = CodeData.fromForm(codelistForm);
    Navigator.pop(context, {'form': codelistForm});
    return true;
  }

  void send() {
    if (kDebugMode) {
      print(codelistForm.form.rawValue);
    }
    codelistForm.codeList?.data = CodeData.fromForm(codelistForm);
    Navigator.pop(context, {'form': codelistForm});
  }

  void onAddPressed() {
    (codelistForm.form.control("data") as FormArray).add(FormGroup({
      ...{"selected": FormControl(value: false)},
      "value": FormGroup(
        Map.fromEntries(codelistForm.model.definition?.columns
                ?.map((column) => MapEntry(column.name, FormControl()))
                .toList() ??
            []),
      )
    }));
  }
}
