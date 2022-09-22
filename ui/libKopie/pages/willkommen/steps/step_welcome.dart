import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class WelcomeStepContent extends StatefulWidget {
  const WelcomeStepContent({Key? key}) : super(key: key);

  @override
  State<WelcomeStepContent> createState() => _WelcomeStepContentState();
}

class _WelcomeStepContentState extends State<WelcomeStepContent> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 700,
      ),
      child: Column(children: [
        FormBuilderTextField(
          name: 'Titel',
          decoration: const InputDecoration(labelText: 'Titel'),
        ),
        FormBuilderTextField(
          name: 'Vorname',
          decoration: const InputDecoration(labelText: 'Vornamen'),
        ),
        FormBuilderTextField(
          name: 'Nachname',
          decoration: const InputDecoration(labelText: 'Nachname'),
        ),
        FormBuilderTextField(
          name: 'AnzahlKinder',
          decoration: const InputDecoration(labelText: 'Anzahl Kinder'),
          keyboardType: TextInputType.number,
          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          validator: FormBuilderValidators.numeric(
              errorText: "Feld muss eine Zahl sein"),
        ),
        FormBuilderTextField(
          name: 'Abschlussnote',
          decoration: const InputDecoration(labelText: 'Abschlussnote'),
        ),
        Html(data: """
<h1>
Überschrift
</h1>
<p>
Ein Absatz dies ist.
</p>
"""),
      ]),
    );
  }
}
