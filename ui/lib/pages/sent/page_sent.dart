import 'package:flutter/material.dart';

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
        title: const Text('Antrag erfolgreich versandt'),
      ),
      body: Center(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: const [
                Text(
                  "Formular erfolgreich versandt",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                    "Ihr Antrag wurde erfolgreich versandt. Weiterer Text, wie es jetzt weitergeht usw."),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
