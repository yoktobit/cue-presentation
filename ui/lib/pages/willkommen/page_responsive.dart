import 'dart:html';
import 'dart:convert';
import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:multi_masked_formatter/multi_masked_formatter.dart';
import 'package:pattern_formatter/date_formatter.dart';
import 'package:reactive_forms/reactive_forms.dart';
import 'package:reactive_text_field/reactive_text_field.dart' as react;
import 'package:test1/controls/datepicker_form_field.dart';
import 'package:test1/controls/separated_date.dart';
import 'package:test1/controls/separated_date_field.dart';
import 'package:test1/services/sending_service.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'steps/step_personendaten.dart';

class ResponsivePage extends StatefulWidget {
  final SendingService sendingService;
  const ResponsivePage(final this.sendingService, {Key? key}) : super(key: key);

  @override
  State<ResponsivePage> createState() => _ResponsivePageState();
}

class _ResponsivePageState extends State<ResponsivePage> {
  final _formKey = GlobalKey<FormBuilderState>();
  int index = 0;

  final form = FormGroup({
    "name": FormControl<String>(),
    "vorname": FormControl<String>(),
    "geburtsdatum": FormControl<String>(),
    "birth": FormControl<SeparatedDate>(),
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reactive Form'),
      ),
      body: Stepper(
        currentStep: index,
        onStepTapped: (value) => setState(() {
          index = value;
        }),
        type: StepperType.horizontal,
        steps: [
          Step(
            title: const Text("Schritt 1"),
            content: ReactiveForm(
              formGroup: form,
              child: Column(children: [
                Card(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const ListTile(
                        title: Text("Personendaten"),
                      ),
                      const Divider(),
                      react.ReactiveTextField<String>(
                        formControlName: "name",
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                          labelText: "Name",
                        ),
                      ),
                      const Divider(),
                      ReactiveTextField<String>(
                        formControlName: "vorname",
                        decoration: const InputDecoration(
                          floatingLabelBehavior: FloatingLabelBehavior.always,
                          border: OutlineInputBorder(),
                          labelText: "Vorname",
                        ),
                      ),
                      const Divider(),
                      SeparatedDateField(
                        context: context,
                        formControlName: "birth",
                        labelText: "Geburtsdatum",
                      ),
                      const Divider(),
                    ],
                  ),
                )
              ]),
            ),
          ),
          Step(
            title: const Text("Schritt 2"),
            subtitle: const Text("Weiterer Schritt"),
            content: ReactiveForm(
              formGroup: form,
              child: Column(
                children: [],
              ),
            ),
          ),
        ],
        onStepContinue: () {
          print(form.value);
          setState(() {
            index++;
          });
        },
      ),
    );
  }

  stepContinue() {}
}