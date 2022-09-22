import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PersonenDatenStepContent extends StatefulWidget {
  const PersonenDatenStepContent({Key? key}) : super(key: key);

  @override
  State<PersonenDatenStepContent> createState() => _PersonenDatenStepContentState();
}

class _PersonenDatenStepContentState extends State<PersonenDatenStepContent> {
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
