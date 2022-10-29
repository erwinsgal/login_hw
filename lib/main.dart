import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page_hw/pages/language_page.dart';
import 'package:login_page_hw/pages/login_page.dart';
import 'package:login_page_hw/pages/register_page.dart';
import 'package:login_page_hw/translations/codegen_loader.g.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
      EasyLocalization(

          supportedLocales: [Locale('kk'), Locale('en'), Locale('ru')],
          fallbackLocale: Locale('kk'),
          path: 'assets/translations',
          assetLoader: CodegenLoader(),
        child: MyApp(),
      ),);
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const LanguagePage(),
    );
  }
}


//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const LoginPage(),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       initialRoute: '/login',
//       routes: {
//         '/login': (context) => const LoginPage(),
//         '/register': (context) => const SecondPage()
//       },
//     );
//   }
// }