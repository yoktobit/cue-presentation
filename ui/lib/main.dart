import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:test1/model/code_list.dart';
import 'package:test1/model/code_lists.dart';
import 'package:test1/pages/code_list/code_list_page.dart';
import 'package:test1/pages/code_list/code_list_data_page.dart';
import 'package:test1/pages/code_list/code_lists_page.dart';
import 'package:test1/pages/sent/page_sent.dart';
import 'package:test1/pages/start/start_page.dart';
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
      initialRoute: '/',
      routes: {
        '/responsive': (context) => const ResponsivePage(sendingService),
        '/willkommen': (context) => const WillkommenPage(sendingService),
        '/codelist': (context) => CodeListPage(
            codeList: ModalRoute.of(context)?.settings.arguments as CodeList),
        '/codelists': (context) => CodeListsPage(
            codelists: ModalRoute.of(context)?.settings.arguments as CodeLists),
        '/codelistdata': (context) => CodeListDataPage(
            form: ModalRoute.of(context)?.settings.arguments as CodeListForm),
        '/sent': (context) => const SentPage(),
        '/': (context) => const StartPage(),
      },
    );
  }
}
