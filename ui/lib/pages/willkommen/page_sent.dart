import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

import 'steps/step_personendaten.dart';

class SentPage extends StatefulWidget {
  const SentPage({Key? key}) : super(key: key);

  @override
  State<SentPage> createState() => _SentPageState();
}

class _SentPageState extends State<SentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Willkommen'),
      ),
      body: Column(children: const [
        Text("Formular erfolgreich versandt"),
        Placeholder(),
        Text(
            "Ihr Antrag wurde erfolgreich versandt. Weiterer Text, wie es jetzt weitergeht usw."),
      ]),
    );
  }
}
