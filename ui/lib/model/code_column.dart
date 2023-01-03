import 'package:cbor/cbor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'code_column.g.dart';

@FormGroupAnnotation()
@JsonSerializable()
class CodeColumn {
  String name;
  String label;

  CodeColumn({
    @FormControlAnnotation() required this.name,
    @FormControlAnnotation() required this.label,
  });

  factory CodeColumn.fromJson(Map<String, dynamic> json) =>
      _$CodeColumnFromJson(json);

  Map<String, dynamic> toJson() => _$CodeColumnToJson(this);

  CborValue toCbor() {
    return CborValue({
      "name": name,
      "label": label,
    });
  }
}
