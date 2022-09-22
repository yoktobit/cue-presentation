import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'steps/step_welcome.dart';


class WillkommenPage extends StatefulWidget {
  const WillkommenPage({Key? key}) : super(key: key);

  @override
  State<WillkommenPage> createState() => _WillkommenPageState();
}

class _WillkommenPageState extends State<WillkommenPage> {
  int _step = 0;

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
              title: Text('Welcome'),
              content: WelcomeStepContent(),
            ),
            
          ],
        ),
      ),
    );
  }

  stepContinue() {
    setState(() {
      _step++;
    });
  }
}
