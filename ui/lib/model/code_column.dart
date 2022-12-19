import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

@FormGroupAnnotation()
class CodeColumn {
  String name;
  String label;

  CodeColumn({
    @FormControlAnnotation() required this.name,
    @FormControlAnnotation() required this.label,
  });
}
