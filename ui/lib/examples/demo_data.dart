import 'package:test1/model/code_column.dart';
import 'package:test1/model/code_data.dart';
import 'package:test1/model/code_definition.dart';
import 'package:test1/model/code_list.dart';

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
        values: [
          {
            "key": "Key1",
            "label": "Label of Key 1",
            "add1": true,
          },
        ],
      ));
}
