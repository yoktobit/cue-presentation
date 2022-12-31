import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:test1/model/code_column.dart';
import 'package:test1/model/code_data.dart';
import 'package:test1/model/code_definition.dart';
import 'package:test1/model/code_row.dart';

part 'code_list.g.dart';
part 'code_list.gform.dart';

@ReactiveFormAnnotation()
@JsonSerializable()
class CodeList {
  CodeDefinition? definition = CodeDefinition(name: "", label: "");
  CodeData? data = CodeData();

  CodeList({
    required this.definition,
    required this.data,
  });

  factory CodeList.fromJson(Map<String, dynamic> json) =>
      _$CodeListFromJson(json);

  Map<String, dynamic> toJson() => _$CodeListToJson(this);
}
