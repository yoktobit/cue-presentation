import 'dart:html';

import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:intl/intl.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';
import 'package:pattern_formatter/pattern_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test1/controls/separated_date.dart';

class SeparatedDateField
    extends ReactiveFormField<SeparatedDate, SeparatedDate> {
  SeparatedDateField({
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
  ReactiveFormFieldState<SeparatedDate, SeparatedDate> createState() =>
      _SeparatedDateFieldState<SeparatedDate, SeparatedDate>();
}

class _SeparatedDateFieldState<T, V>
    extends ReactiveFormFieldState<SeparatedDate, SeparatedDate> {
  late TextEditingController dayController = TextEditingController();
  late TextEditingController monthController = TextEditingController();
  late TextEditingController yearController = TextEditingController();
  static DateFormat dateFormat = DateFormat("dd.MM.yyyy");

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            icon: const Icon(Icons.date_range),
            onPressed: () async {
              final value = await showDatePicker(
                context: context,
                initialDate: (yearController.text.isNotEmpty &&
                        monthController.text.isNotEmpty &&
                        dayController.text.isNotEmpty)
                    ? DateTime(
                        int.parse(yearController.text),
                        int.parse(monthController.text),
                        int.parse(dayController.text))
                    : DateTime.now(),
                firstDate: DateTime(1900),
                lastDate: DateTime.now(),
              );
              if (value != null) {
                didChange(SeparatedDate(
                    day: value.day, month: value.month, year: value.year));
                dayController.text = value.day.toString();
                monthController.text = value.month.toString();
                yearController.text = value.year.toString();
                control.markAsTouched();
              }
            },
          ),
        ],
      ),
      ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 100),
        child: TextFormField(
          controller: dayController,
          inputFormatters: [
            ThousandsFormatter(formatter: NumberFormat("##")),
            LengthLimitingTextInputFormatter(2)
          ],
          decoration:
              const InputDecoration(labelText: "Geburtstag", helperText: "Tag"),
          onChanged: (value) {
            if (this.value == null) {
              return;
            }
            final newValue = int.tryParse(value);
            if (newValue != null) {
              didChange(SeparatedDate(
                  day: int.parse(value),
                  month: this.value!.month,
                  year: this.value!.year));
            } else {
              didChange(SeparatedDate(day: 0, month: 0, year: 0));
              control.setErrors({"FormatError": "FormatFehler"});
            }
          },
        ),
      ),
      ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 100),
        child: TextFormField(
          controller: monthController,
          inputFormatters: [
            ThousandsFormatter(formatter: NumberFormat("##")),
            LengthLimitingTextInputFormatter(2)
          ],
          decoration: const InputDecoration(labelText: "", helperText: "Monat"),
          onChanged: (value) {
            if (this.value == null) {
              return;
            }
            didChange(SeparatedDate(
                day: this.value!.day,
                month: int.parse(value),
                year: this.value!.year));
          },
        ),
      ),
      ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 100),
        child: TextFormField(
          controller: yearController,
          inputFormatters: [
            ThousandsFormatter(formatter: NumberFormat("####")),
            LengthLimitingTextInputFormatter(4)
          ],
          decoration: const InputDecoration(labelText: "", helperText: "Jahr"),
          onChanged: (value) {
            if (this.value == null) {
              return;
            }
            didChange(SeparatedDate(
                day: this.value!.day,
                month: this.value!.month,
                year: int.parse(value)));
          },
        ),
      ),
    ]);
  }
}
