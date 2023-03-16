import 'package:currency_flutter/di.dart';
import 'package:currency_flutter/pages/home_page.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

void main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await setup();
  runApp(
    EasyLocalization(supportedLocales: const [
          Locale("uz","UZ"),
          Locale("uz","UZC"),
          Locale("ru","RU"),
          Locale("en","EN"),
        ],
        startLocale: const Locale("uz","UZ"),
        path: 'assets/tr', child: const MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Currency',
      theme: ThemeData(),
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      initialRoute: "/home",
      routes: {
        "/home":(context)=>const HomePage().page
      },
    );
  }
}

