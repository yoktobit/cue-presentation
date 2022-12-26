import 'package:reactive_forms_annotations/reactive_forms_annotations.dart';

class CodeRow {
  Map<String, Object?>? value;
  bool selected;

  CodeRow({
    this.selected = false,
    this.value = const {},
  });
}
