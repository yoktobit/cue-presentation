import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';

class ReactiveDatePickerFormField extends ReactiveFormField<String, String> {
  ReactiveDatePickerFormField({
    super.key,
    required BuildContext context,
    required String formControlName,
    AutovalidateMode? autoValidateMode,
    InputDecoration? decoration,
    DateTimeFieldPickerMode mode = DateTimeFieldPickerMode.date,
  }) : super(
            formControlName: formControlName,
            builder: (field) {
              return const TextField();
            });
  @override
  ReactiveFormFieldState<String, String> createState() =>
      _ReactiveDatePickerFormFieldState<String, String>();
}

class _ReactiveDatePickerFormFieldState<T, V>
    extends ReactiveFormFieldState<String, String> {
  late TextEditingController textFieldController = TextEditingController();
  DateFormat dateFormat = DateFormat("dd.MM.yyyy");

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textFieldController,
      inputFormatters: [
        MultiMaskedTextInputFormatter(
          masks: ["##.##.####"],
          separator: '.',
        )
      ],
      decoration: InputDecoration(
        labelText: "Geburtsdatum",
        icon: IconButton(
          icon: Icon(Icons.date_range),
          onPressed: () async {
            final currentDateText = textFieldController.text;
            DateTime? currentDate;
            if (currentDateText.isNotEmpty) {
              currentDate = dateFormat.parse(currentDateText);
            }
            final value = await showDatePicker(
              context: context,
              initialDate: currentDate ?? DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
            );
            if (value != null) {
              final newValue = dateFormat.format(value);
              didChange(newValue);
              control.markAsTouched();
              textFieldController.text = newValue;
            }
          },
        ),
      ),
      onChanged: (value) {
        didChange(value);
      },
    );
  }
}
