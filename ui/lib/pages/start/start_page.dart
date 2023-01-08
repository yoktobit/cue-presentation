import 'dart:convert';
import 'dart:io';

import 'package:cbor/simple.dart';
import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:test1/controls/medium_divider.dart';
import 'package:test1/examples/demo_data.dart';
import 'package:test1/model/code_list.dart';
import 'package:test1/model/code_lists.dart';
import 'package:test1/pages/code_list/code_lists_page.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  CodeLists? codelists;

  int _selectedIndex = 0;

  String? cborToken;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Konfigurator"),
        actions: [
          IconButton(
            onPressed: () => onSavePressed(context),
            icon: const Icon(Icons.save_outlined),
            padding: kDebugMode
                ? const EdgeInsetsDirectional.only(end: 50)
                : const EdgeInsets.all(8),
          ),
        ],
      ),
      floatingActionButton: _selectedIndex == 1
          ? FloatingActionButton(
              onPressed: onNewCodelist, child: const Icon(Icons.add))
          : null,
      bottomNavigationBar: codelists != null
          ? BottomNavigationBar(
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Dashboard",
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                  label: "Listen",
                ),
              ],
              onTap: (index) {
                setState(() {
                  _selectedIndex = index;
                });
              },
              currentIndex: _selectedIndex,
            )
          : null,
      body: _selectedIndex == 0
          ? SingleChildScrollView(
              child: Column(
                children: [
                  const MediumDivider(),
                  ElevatedButton(
                      onPressed: () => onNewConfigurationPressed(context),
                      child: const Text("Neue Konfiguration")),
                  const MediumDivider(),
                  ElevatedButton(
                      onPressed: () => onLoadConfigurationPressed(context),
                      child: const Text("Konfiguration laden...")),
                  const MediumDivider(),
                  ElevatedButton(
                      onPressed: codelists?.id != null
                          ? () => onSavePressed(context)
                          : null,
                      child: const Text("Konfiguration speichern")),
                  const MediumDivider(),
                  ElevatedButton(
                      onPressed: () => onSampleConfigurationPressed(context),
                      child: const Text("Beispielkonfiguration laden")),
                  const MediumDivider(),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    SelectableText(
                        'Geladene Konfigurations-ID: ${codelists?.id}'),
                    IconButton(
                        onPressed: () => Clipboard.setData(
                            ClipboardData(text: codelists?.id)),
                        icon: const Icon(Icons.copy)),
                  ]),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Expanded(
                      child: SelectableText(
                        'CBOR-Token: $cborToken',
                        maxLines: 10,
                      ),
                    ),
                    IconButton(
                        onPressed: () =>
                            Clipboard.setData(ClipboardData(text: cborToken)),
                        icon: const Icon(Icons.copy)),
                  ]),
                ],
              ),
            )
          : CodeListsPage(
              codelists: codelists,
            ),
    );
  }

  void onNewConfigurationPressed(BuildContext context) {
    setState(() {
      codelists = CodeLists.newEmpty();
      _selectedIndex = 1;
    });
  }

  void onLoadConfigurationPressed(BuildContext context) async {
    await showMaterialFilePicker(
        onChanged: (file) => uploadFinished(file, context));
  }

  void onSampleConfigurationPressed(BuildContext context) {
    setState(() {
      codelists = createDemoCodeLists();
      _selectedIndex = 1;
    });
  }

  void uploadFinished(PlatformFile file, BuildContext context) {
    final jsonBytes = file.bytes!;
    final jsonMap = jsonDecode(String.fromCharCodes(jsonBytes));
    setState(() {
      codelists = CodeLists.fromJson(jsonMap);
      _selectedIndex = 1;
    });
  }

  void onSavePressed(BuildContext context) {
    final json = jsonEncode(codelists);
    FileSaver.instance.saveFile(
        codelists!.id, Uint8List.fromList(json.codeUnits), "json",
        mimeType: MimeType.JSON);

    final gzipped = gzip.encode(cbor.encode(codelists));
    setState(() {
      cborToken = base64UrlEncode(gzipped);
    });

    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Codelisten im Downloadordner gespeichert")));
  }

  void onNewCodelist() async {
    final newCodeList = await Navigator.pushNamed(context, '/codelist',
        arguments: CodeList.newEmpty()) as CodeList;
    setState(() {
      codelists?.lists.add(newCodeList);
      _selectedIndex = 1;
    });
  }
}
