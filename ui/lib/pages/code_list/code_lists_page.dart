import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:test1/examples/demo_data.dart';
import 'package:test1/model/code_list.dart';
import 'package:test1/model/code_lists.dart';
import 'package:test1/pages/start/navigation_bar.dart';

class CodeListsPage extends StatefulWidget {
  final CodeLists? codelists;

  const CodeListsPage({Key? key, this.codelists}) : super(key: key);

  @override
  State<CodeListsPage> createState() => _CodeListsPageState();
}

class _CodeListsPageState extends State<CodeListsPage> {
  late CodeLists codelists;

  @override
  void initState() {
    codelists = widget.codelists ?? createDemoCodeLists();
    if (kDebugMode) {
      print("State initialized");
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Übersicht der Code-Listen'),
      ),
      bottomNavigationBar: createBottomNavigationBar(context, codelists),
      body: Column(
        children: [
          DataTable(
            columns: const [
              DataColumn(label: Text("Name")),
              DataColumn(label: Text("Beschreibung")),
              DataColumn(label: Text("Aktionen")),
            ],
            rows: codelists.lists
                .map(
                  (codelist) => DataRow(
                    cells: [
                      DataCell(Text(codelist.definition?.name ?? "")),
                      DataCell(Text(codelist.definition?.label ?? "")),
                      DataCell(ElevatedButton.icon(
                        onPressed: () => onEditButtonPressed(codelist),
                        icon: const Icon(Icons.edit),
                        label: const Text("Edit"),
                      )),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }

  void onEditButtonPressed(CodeList codelist) {
    Navigator.pushNamed(context, '/codelist', arguments: codelist);
  }
}
