import 'package:test1/model/code_column.dart';
import 'package:test1/model/code_data.dart';
import 'package:test1/model/code_definition.dart';
import 'package:test1/model/code_list.dart';
import 'package:test1/model/code_row.dart';
import 'package:test1/model/code_lists.dart';

CodeLists createDemoCodeLists() => CodeLists(
      lists: [
        createDemoCodeList(),
      ],
    );

CodeList createDemoCodeList() {
  return CodeList(
      definition: CodeDefinition(
        name: "DemoList",
        label: "Demo List",
        columns: [
          CodeColumn(name: "key", label: "Code"),
          CodeColumn(name: "label", label: "Label"),
          CodeColumn(name: "add1", label: "Additional Value"),
        ],
      ),
      data: CodeData(
        rows: [
          CodeRow(value: {
            "key": "Key1",
            "label": "Label of Key 1",
            "add1": "true",
          }),
          CodeRow(value: {
            "key": "Key2",
            "label": "Label of Key 2",
            "add1": "false",
          }),
          CodeRow(value: {
            "key": "Key3",
            "label": "Label of Key 3",
            "add1": "false",
          }),
        ],
      ));
}
