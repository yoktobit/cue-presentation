import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:test1/model/code_column.dart';
import 'package:test1/model/globals.dart';
import 'package:uuid/uuid.dart';

part 'code_definition.g.dart';

@FormGroupAnnotation()
@JsonSerializable()
class CodeDefinition {
  String name;
  String label;
  late String id;

  List<CodeColumn>? columns;

  CodeDefinition({
    @FormControlAnnotation() required this.name,
    @FormControlAnnotation() required this.label,
    @FormArrayAnnotation() this.columns = const [],
    String? id,
  }) {
    if (id != null) {
      this.id = id;
    } else {
      this.id = const Uuid().v5(Uuid.NAMESPACE_URL, domain);
    }
  }

  factory CodeDefinition.fromJson(Map<String, dynamic> json) =>
      _$CodeDefinitionFromJson(json);

  Map<String, dynamic> toJson() => _$CodeDefinitionToJson(this);
}
