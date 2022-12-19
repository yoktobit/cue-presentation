import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';
import 'package:test1/model/code_column.dart';

@FormGroupAnnotation()
class CodeDefinition {
  String name;
  String label;

  List<CodeColumn>? columns;

  CodeDefinition({
    @FormControlAnnotation() required this.name,
    @FormControlAnnotation() required this.label,
    @FormArrayAnnotation() this.columns = const [],
  });
}
