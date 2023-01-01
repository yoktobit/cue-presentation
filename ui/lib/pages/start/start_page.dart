import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:file_saver/file_saver.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:test1/examples/demo_data.dart';
import 'package:test1/model/code_lists.dart';
import 'package:test1/pages/start/navigation_bar.dart';

class StartPage extends StatefulWidget {
  const StartPage({super.key});

  @override
  State<StatefulWidget> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  CodeLists? codelists;

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
      bottomNavigationBar: createBottomNavigationBar(context, codelists),
      body: Column(
        children: [
          ElevatedButton(
              onPressed: () => onNewConfigurationPressed(context),
              child: const Text("Neue Konfiguration")),
          const Divider(),
          ElevatedButton(
              onPressed: () => onLoadConfigurationPressed(context),
              child: const Text("Konfiguration laden...")),
          const Divider(),
          ElevatedButton(
              onPressed: () => onSampleConfigurationPressed(context),
              child: const Text("Beispielkonfiguration laden")),
          const Divider(),
          ElevatedButton(
              onPressed: () => onSavePressed(context),
              child: const Text("Konfiguration speichern")),
        ],
      ),
    );
  }

  void onNewConfigurationPressed(BuildContext context) {
    setState(() {
      codelists = CodeLists.newEmpty();
    });

    Navigator.pushNamed(context, '/codelists', arguments: codelists);
  }

  void onLoadConfigurationPressed(BuildContext context) async {
    await showMaterialFilePicker(
        onChanged: (file) => uploadFinished(file, context));
  }

  void onSampleConfigurationPressed(BuildContext context) {
    setState(() {
      codelists = createDemoCodeLists();
    });
    Navigator.pushNamed(context, '/codelists', arguments: codelists);
  }

  void uploadFinished(PlatformFile file, BuildContext context) {
    final jsonBytes = file.bytes!;
    final jsonMap = jsonDecode(String.fromCharCodes(jsonBytes));
    setState(() {
      codelists = CodeLists.fromJson(jsonMap);
    });
    Navigator.pushNamed(context, '/codelists', arguments: codelists);
  }

  void onSavePressed(BuildContext context) {
    FileSaver.instance.saveFile(
        "test", Uint8List.fromList(jsonEncode(codelists).codeUnits), "json",
        mimeType: MimeType.JSON);
    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Codelisten im Downloadordner gespeichert")));
  }
}
