import 'package:flutter/material.dart';
import 'pages/willkommen/page_willkommen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test1',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const WillkommenPage(),
    );
  }
}
