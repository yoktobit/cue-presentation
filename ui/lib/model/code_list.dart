import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:test1/model/code_column.dart';
import 'package:test1/model/code_data.dart';
import 'package:test1/model/code_definition.dart';

part 'code_list.gform.dart';

@ReactiveFormAnnotation()
class CodeList {
  CodeDefinition? definition = CodeDefinition(name: "", label: "");
  CodeData? data = CodeData();

  CodeList({
    required this.definition,
    required this.data,
  });
}
