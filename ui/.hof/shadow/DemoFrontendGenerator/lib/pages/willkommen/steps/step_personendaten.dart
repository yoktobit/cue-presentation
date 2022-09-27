import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

class PersonendatenStepContent extends StatefulWidget {
  const PersonendatenStepContent({Key? key}) : super(key: key);

  @override
  State<PersonendatenStepContent> createState() => _PersonendatenStepContentState();
}

class _PersonendatenStepContentState extends State<PersonendatenStepContent> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxWidth: 700,
      ),
      child: Column(children: [
        
          
            
FormBuilderTextField(
    name: 'titel',
    decoration: const InputDecoration(labelText: 'Titel'),
),
          
        
          
            
FormBuilderTextField(
    name: 'vorname',
    decoration: const InputDecoration(labelText: 'Vornamen'),
),
          
        
          
            
FormBuilderTextField(
    name: 'nachname',
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
