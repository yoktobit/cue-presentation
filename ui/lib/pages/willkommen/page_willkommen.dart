import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:test1/services/sending_service.dart';

import 'steps/step_personendaten.dart';

class WillkommenPage extends StatefulWidget {
  final SendingService sendingService;
  const WillkommenPage(final this.sendingService, {Key? key}) : super(key: key);

  @override
  State<WillkommenPage> createState() => _WillkommenPageState();
}

class _WillkommenPageState extends State<WillkommenPage> {
  int _step = 0;
  static const int stepCount = 1;
  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Willkommen'),
      ),
      body: FormBuilder(
        key: _formKey,
        child: Stepper(
          onStepContinue: stepContinue,
          currentStep: _step,
          steps: const [
            Step(
              title: Text('Personendaten'),
              content: PersonendatenStepContent(),
            ),
          ],
        ),
      ),
    );
  }

  stepContinue() {
    if (_step < stepCount - 1) {
      setState(() {
        _step++;
      });
    } else {
      final data = {
        'Titel': _formKey.currentState?.fields['titel']?.transformedValue,
        'Vorname': _formKey.currentState?.fields['vorname']?.transformedValue,
        'Nachname': _formKey.currentState?.fields['nachname']?.transformedValue,
      };

      final json = jsonEncode(data);
      [1, 2, 3].forEach((index1) {
        [1, 2, 3].forEach((index2) {
          print(_formKey.currentState?.fields['kindername_${index1}_$index2']
              ?.transformedValue);
        });
      });
      print(_formKey.currentState?.fields);
      //widget.sendingService.send("/demo/person/create", json);
      Navigator.pushNamed(context, '/sent');
    }
  }
}
