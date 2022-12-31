import 'dart:convert';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_material_pickers/flutter_material_pickers.dart';
import 'package:test1/examples/demo_data.dart';
import 'package:test1/model/code_lists.dart';

class StartPage extends StatelessWidget {
  const StartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Konfigurator")),
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
        ],
      ),
    );
  }

  void onNewConfigurationPressed(BuildContext context) {
    Navigator.pushNamed(context, '/codelists', arguments: CodeLists.newEmpty());
  }

  void onLoadConfigurationPressed(BuildContext context) async {
    await showMaterialFilePicker(
        onChanged: (file) => uploadFinished(file, context));
  }

  void onSampleConfigurationPressed(BuildContext context) {
    Navigator.pushNamed(context, '/codelists',
        arguments: createDemoCodeLists());
  }

  void uploadFinished(PlatformFile file, BuildContext context) {
    final jsonBytes = file.bytes!;
    final jsonMap = jsonDecode(String.fromCharCodes(jsonBytes));
    Navigator.pushNamed(context, '/codelists',
        arguments: CodeLists.fromJson(jsonMap));
  }
}
