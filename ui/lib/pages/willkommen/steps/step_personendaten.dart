import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_html/flutter_html.dart';

class PersonendatenStepContent extends StatefulWidget {
  const PersonendatenStepContent({Key? key}) : super(key: key);

  @override
  State<PersonendatenStepContent> createState() =>
      _PersonendatenStepContentState();
}

class _PersonendatenStepContentState extends State<PersonendatenStepContent> {
  final List<int> list1 = List.generate(3, (index) => index + 1);
  final List<int> list2 = List.generate(2, (index) => index + 1);

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
        Card(
          child: Column(
            children: [
              const ListTile(
                title: Text("Kinder"),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                    children: list1
                        .map((index1) => Card(
                              child: Column(children: [
                                ListTile(
                                  title: Text("Card Nr. $index1"),
                                  subtitle: Text("This is card nr $index1"),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(children: [
                                    Card(
                                      child: Column(
                                        children: [
                                          const ListTile(
                                            title: Text("Unter-Kinder"),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Column(
                                                children: list1
                                                    .map((index2) => Card(
                                                          child: Column(
                                                              children: [
                                                                ListTile(
                                                                  title: Text(
                                                                      "Card Nr. $index2"),
                                                                  subtitle: Text(
                                                                      "This is card nr $index2"),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                              .all(
                                                                          10.0),
                                                                  child: Column(
                                                                      children: [
                                                                        FormBuilderTextField(
                                                                          name:
                                                                              'kindername_${index1}_$index2',
                                                                          decoration:
                                                                              const InputDecoration(labelText: 'Name des Kindes'),
                                                                        ),
                                                                      ]),
                                                                ),
                                                              ]),
                                                        ))
                                                    .toList()),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.all(10.0),
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                ElevatedButton(
                                                  child: const Text(
                                                      "Unter-Kinder hinzufügen"),
                                                  onPressed: () => setState(
                                                    () {
                                                      list1.add(
                                                          list1.length + 1);
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ]),
                                ),
                              ]),
                            ))
                        .toList()),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      child: const Text("Kinder hinzufügen"),
                      onPressed: () => setState(
                        () {
                          list1.add(list1.length + 1);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
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
