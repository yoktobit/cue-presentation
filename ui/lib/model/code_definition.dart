import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:test1/model/code_column.dart';

part 'code_definition.g.dart';

@FormGroupAnnotation()
@JsonSerializable()
class CodeDefinition {
  String name;
  String label;

  List<CodeColumn>? columns;

  CodeDefinition({
    @FormControlAnnotation() required this.name,
    @FormControlAnnotation() required this.label,
    @FormArrayAnnotation() this.columns = const [],
  });

  factory CodeDefinition.fromJson(Map<String, dynamic> json) =>
      _$CodeDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$CodeDefinitionToJson(this);
}
