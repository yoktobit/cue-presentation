import 'dart:convert';
import 'dart:html';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:test1/examples/demo_data.dart';
import 'package:test1/model/code_list.dart';
import 'package:test1/pages/code_list/code_lists.dart';

class CodeListsPage extends StatefulWidget {
  CodeLists? codelists;

  CodeListsPage({Key? key}) : super(key: key);

  @override
  State<CodeListsPage> createState() => _CodeListsPageState();
}

class _CodeListsPageState extends State<CodeListsPage> {
  @override
  Widget build(BuildContext context) {
    widget.codelists = createDemoCodeLists();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Übersicht der Code Listen'),
      ),
      body: Column(
        children: [
          if (widget.codelists != null)
            DataTable(
              columns: const [
                DataColumn(label: Text("Name")),
                DataColumn(label: Text("Beschreibung")),
                DataColumn(label: Text("Aktionen")),
              ],
              rows: widget.codelists?.lists
                      .map(
                        (codelist) => DataRow(
                          cells: [
                            DataCell(Text(codelist.definition?.name ?? "")),
                            DataCell(Text(codelist.definition?.label ?? "")),
                            DataCell(ElevatedButton.icon(
                              onPressed: onEditButtonPressed,
                              icon: const Icon(Icons.edit),
                              label: const Text("Edit"),
                            )),
                          ],
                        ),
                      )
                      .toList() ??
                  [],
            )
          else
            Column(
              children: [
                const Text("Noch keine Datei gewählt, bitte Datei hochladen"),
                ElevatedButton(
                    onPressed: onUploadPressed,
                    child: const Text("Datei hochladen...")),
              ],
            )
        ],
      ),
    );
  }

  void onUploadPressed() async {
    await showMaterialFilePicker(onChanged: uploadFinished);
  }

  void uploadFinished(PlatformFile file) {
    final jsonData = file.bytes!;
    jsonDecode(String.fromCharCodes(jsonData));
  }

  void onEditButtonPressed() {}
}
