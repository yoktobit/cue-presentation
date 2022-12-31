import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:test1/controls/separated_date.dart';

class SeparatedDateField
    extends ReactiveFormField<SeparatedDate, SeparatedDate> {
  final String? labelText;

  SeparatedDateField({
    super.key,
    required BuildContext context,
    required String formControlName,
    AutovalidateMode? autoValidateMode,
    InputDecoration? decoration,
    this.labelText = "",
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

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 150),
        child: Focus(
          onFocusChange: (value) => _focusChange(value, dayController, 0),
          skipTraversal: true,
          child: TextFormField(
            controller: dayController,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2)
            ],
            decoration: InputDecoration(
              labelText: (widget as SeparatedDateField).labelText,
              helperText: "Tag",
              floatingLabelBehavior: FloatingLabelBehavior.always,
              border: const OutlineInputBorder(),
            ),
            onEditingComplete: () => _editingComplete(dayController, 0),
            onChanged: (value) => _changed(value, 0),
          ),
        ),
      ),
      const Padding(padding: EdgeInsets.all(5)),
      ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 150),
        child: Focus(
          onFocusChange: (value) => _focusChange(value, monthController, 1),
          skipTraversal: true,
          child: TextFormField(
            controller: monthController,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(2)
            ],
            decoration: const InputDecoration(
              labelText: "",
              helperText: "Monat",
              border: OutlineInputBorder(),
            ),
            onEditingComplete: () => _editingComplete(monthController, 1),
            onChanged: (value) => _changed(value, 1),
          ),
        ),
      ),
      const Padding(padding: EdgeInsets.all(5)),
      ConstrainedBox(
        constraints: const BoxConstraints.tightFor(width: 150),
        child: Focus(
          onFocusChange: (value) => _focusChange(value, yearController, 2),
          skipTraversal: true,
          child: TextFormField(
            controller: yearController,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(4)
            ],
            decoration: const InputDecoration(
              labelText: "",
              helperText: "Jahr",
              border: OutlineInputBorder(),
            ),
            onEditingComplete: () => _editingComplete(yearController, 2),
            onChanged: (value) => _changed(value, 2),
          ),
        ),
      ),
      const Padding(padding: EdgeInsets.all(5)),
      Center(
        child: IconButton(
          icon: const Icon(Icons.date_range),
          iconSize: 30,
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
      ),
    ]);
  }

  void _editingComplete(TextEditingController controller, int field) {
    if (controller.text.isEmpty) {
      return;
    }
    if (controller.text.length == 1 || controller.text.length == 3) {
      control.setErrors({"WrongDateFormatError": "Wrong Date Format Error"});
    }

    if (field == 2 && controller.text.length == 2) {
      controller.text = "20${controller.text}";
    } else if (field < 2 && controller.text.length == 1) {
      controller.text = controller.text.padLeft(2, '0');
    }
    _changed(controller.text, field);
  }

  void _changed(String? value, int field) {
    if (value == null || value.isEmpty) {
      return;
    }
    final newValue = int.tryParse(value);
    if (newValue != null) {
      didChange(SeparatedDate(
        day: field == 0 ? newValue : (this.value?.day ?? 0),
        month: field == 1 ? newValue : (this.value?.month ?? 0),
        year: field == 2 ? newValue : (this.value?.year ?? 0),
      ));
      control.markAsTouched();
    } else {
      didChange(SeparatedDate(day: 0, month: 0, year: 0));
      control.setErrors({"FormatError": "FormatFehler"});
    }
  }

  void _focusChange(
      bool hasFocus, TextEditingController controller, int field) {
    if (!hasFocus) {
      _editingComplete(controller, field);
    }
  }
}
