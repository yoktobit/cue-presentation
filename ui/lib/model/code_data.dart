import 'package:json_annotation/json_annotation.dart';
import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:test1/model/code_list.dart';
import 'package:test1/model/code_row.dart';

part 'code_data.g.dart';

@JsonSerializable()
class CodeData {
  List<CodeRow>? rows;

  CodeData({
    this.rows = const [],
  });

  factory CodeData.fromJson(Map<String, dynamic> json) =>
      _$CodeDataFromJson(json);

  factory CodeData.fromForm(CodeListForm codeListForm) {
    final codeDataFormArray = codeListForm.form.control("data") as FormArray;
    List<CodeRow>? rows = [];
    for (FormGroup codeDataFormGroup in codeDataFormArray.controls.cast()) {
      rows.add(CodeRow.fromJson(codeDataFormGroup.rawValue));
    }
    return CodeData(rows: rows);
  }

  Map<String, dynamic> toJson() => _$CodeDataToJson(this);
}
