import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl_browser.dart';
import 'package:test1/pages/sent/page_sent.dart';
import 'package:test1/pages/willkommen/page_responsive.dart';
import 'package:test1/services/sending_service.dart';
import 'package:test1/pages/willkommen/page_willkommen.dart';

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
      locale: const Locale("de", "DE"),
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('de', 'DE'),
      ],
      title: 'Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      initialRoute: '/responsive',
      routes: {
        '/responsive': (context) => const ResponsivePage(sendingService),
        '/willkommen': (context) => const WillkommenPage(sendingService),
        '/sent': (context) => const SentPage(),
      },
    );
  }
}
