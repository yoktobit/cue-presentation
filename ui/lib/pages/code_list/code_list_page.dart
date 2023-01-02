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
}
