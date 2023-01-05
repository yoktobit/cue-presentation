import 'dart:convert';

import 'package:excel/excel.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test1/model/code_data.dart';
import 'package:test1/model/code_list.dart';
import 'package:test1/model/code_row.dart';

class CodeListPage extends StatefulWidget {
  final CodeList codeList;

  const CodeListPage({Key? key, required this.codeList}) : super(key: key);

  @override
  State<CodeListPage> createState() => _CodeListPageState();
}

class _CodeListPageState extends State<CodeListPage> {
  @override
  Widget build(BuildContext context) {
    return CodeListFormBuilder(
      model: widget.codeList,
      builder: (context, formModel, child) => Scaffold(
        appBar: AppBar(
          title: Text('Code-Liste ${formModel.model.definition?.name}'),
        ),
        body: Card(
          child: WillPopScope(
            onWillPop: () async => onBack(formModel),
            child: Column(
              children: [
                ReactiveTextField(
                  formControl: formModel.definitionForm.nameControl,
                  decoration: const InputDecoration(
                    labelText: "Name",
                  ),
                  onChanged: (control) => setState(() {}),
                ),
                ReactiveTextField(
                  formControl: formModel.definitionForm.labelControl,
                  decoration: const InputDecoration(
                    labelText: "Label",
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ReactiveCheckbox(
                      formControl:
                          formModel.definitionForm.isSingleRecordControl,
                    ),
                    const Text("Einzeldatensatz"),
                  ],
                ),
                const Divider(),
                ReactiveCodeListFormConsumer(
                  builder: (context, formGroup, child) => ElevatedButton(
                    onPressed: () => gotoDefinition(formGroup),
                    child: const Text("Definition bearbeiten"),
                  ),
                ),
                const Divider(),
                ReactiveCodeListFormConsumer(
                  builder: (context, formGroup, child) => ElevatedButton(
                    onPressed: () => gotoData(formGroup),
                    child: const Text("Daten bearbeiten"),
                  ),
                ),
                const Divider(),
                ReactiveCodeListFormConsumer(
                  builder: (context, formGroup, child) => ElevatedButton(
                    onPressed: () => importData(formGroup),
                    child: const Text("Daten importieren"),
                  ),
                ),
                const Divider(),
                ReactiveCodeListFormConsumer(
                  builder: (context, formGroup, child) => ElevatedButton(
                    onPressed: () => exportData(formGroup),
                    child: const Text("Daten exportieren"),
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
    Navigator.pop(context, codeList.model);
    if (kDebugMode) {
      print("Popped out of ListPage");
    }
    return true;
  }

  void download(FormGroup form) {
    if (kDebugMode) {
      print(jsonEncode(form));
    }
  }

  gotoData(CodeListForm form) {
    Navigator.pushNamed(context, '/codelistdata', arguments: form).then(
      (map) {
        setState(() {});
      },
    );
  }

  gotoDefinition(CodeListForm formGroup) {
    Navigator.pushNamed(context, '/codelistdefinition', arguments: formGroup)
        .then(
      (map) {
        setState(() {});
      },
    );
  }

  importData(CodeListForm codeListForm) async {
    await showMaterialFilePicker(
        onChanged: (file) => importUploadFinished(file, context, codeListForm));
  }

  importUploadFinished(
      PlatformFile file, BuildContext context, CodeListForm codeListForm) {
    final excelFile = file.bytes!;
    final excel = Excel.decodeBytes(excelFile);
    final sheetName = codeListForm.definitionForm.nameControl.value ?? "Sheet1";
    Map<int, String> headings = {};
    List<CodeRow> rows = [];
    for (var row in excel.sheets[sheetName]?.rows ?? []) {
      Map<String, String> record = {};
      bool isHeading = false;
      for (var column in row ?? []) {
        if ((column as Data).rowIndex == 0) {
          isHeading = true;
          headings.addAll(
              {column.colIndex: (column.value as SharedString).node.innerText});
        } else {
          record.addAll({
            headings[column.colIndex] ?? "col${column.colIndex}":
                (column.value as SharedString).node.innerText
          });
        }
      }
      if (!isHeading) {
        rows.add(CodeRow(value: record));
      }
    }
    setState(() {
      codeListForm.codeList?.data = CodeData(rows: rows);
    });
  }

  exportData(CodeListForm formGroup) {
    final excel = Excel.createExcel();
    final oldSheetName = excel.getDefaultSheet();
    final sheetName = formGroup.definitionForm.nameControl.value ?? "Sheet1";
    excel.appendRow(sheetName,
        formGroup.model.definition?.columns?.map((e) => e.name).toList() ?? []);
    formGroup.model.data?.rows?.forEach((element) {
      excel.appendRow(sheetName, element.value?.values.toList() ?? []);
    });
    excel.delete(oldSheetName ?? "Sheet1");
    excel.delete("Sheet1");
    excel.setDefaultSheet(sheetName);
    final excelFile = excel.encode();
    FileSaver.instance.saveFile(formGroup.model.definition?.id ?? "test",
        Uint8List.fromList(excelFile!), "xlsx",
        mimeType: MimeType.MICROSOFTEXCEL);
  }
}
