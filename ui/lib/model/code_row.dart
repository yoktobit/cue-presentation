import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

part 'code_row.g.dart';

@JsonSerializable()
class CodeRow {
  Map<String, Object?>? value;
  bool selected;

  CodeRow({
    this.selected = false,
    this.value = const {},
  });

  factory CodeRow.fromJson(Map<String, dynamic> json) =>
      _$CodeRowFromJson(json);

  Map<String, dynamic> toJson() => _$CodeRowToJson(this);
}
