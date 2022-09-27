import 'package:flutter/material.dart';
import 'package:test1/pages/sent/page_sent.dart';
import 'package:test1/services/sending_service.dart';
import 'package:test1/pages/{{ lower .Frontend.FirstPage }}/page_{{ lower .Frontend.FirstPage }}.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    const sendingService = SendingService();
    return MaterialApp(
      title: '{{ .Frontend.AppTitle }}',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const {{ .Frontend.FirstPage }}Page(sendingService),
        '/sent': (context) => const SentPage(),
      },
    );
  }
}
