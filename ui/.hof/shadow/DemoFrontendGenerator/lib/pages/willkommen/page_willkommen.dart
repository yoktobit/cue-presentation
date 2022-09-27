import 'dart:html';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:test1/services/sending_service.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

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
        title: Text('Willkommen'),
      ),
      body: FormBuilder(
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
      final data = {'titel': _formKey.currentState?.fields['titel']?.transformedValue,'vorname': _formKey.currentState?.fields['vorname']?.transformedValue,'nachname': _formKey.currentState?.fields['nachname']?.transformedValue,'statichtmlfield': _formKey.currentState?.fields['statichtmlfield']?.transformedValue,};
      final json = jsonEncode(data);
      widget.sendingService.send("/demo/person/create", json);
      Navigator.pushNamed(context, '/sent');
    }
  }
}
