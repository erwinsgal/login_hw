import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:login_page_hw/pages/login_page.dart';
import 'package:login_page_hw/pages/register_page.dart';

import '../bloc/app_bloc.dart';
import '../model/user.dart';

class LanguagePage extends StatefulWidget {
  const LanguagePage({Key? key}) : super(key: key);

  @override
  State<LanguagePage> createState() => _LanguagePage();
}

class _LanguagePage extends State<LanguagePage> {
  late AppBloc appBloc;

  @override
  void initState() {
    appBloc = BlocProvider.of<AppBloc>(context);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
        minimumSize: const Size(150, 70),
        primary: Colors.white,
        textStyle: const TextStyle(
            fontSize: 20, color: Colors.purple, fontWeight: FontWeight.w400));
    return Scaffold(
      body: Center(
        child: Container(
            alignment: Alignment.center,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/images/background.jpg'),
              fit: BoxFit.cover,
            )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                    style: style,
                    onPressed: () async {
                      await context.setLocale(Locale('ru'));
                      appBloc.add(AppStartedEvent());

                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Русский",
                      style: TextStyle(
                          color: Colors.purple, fontFamily: 'Montserrat'),
                    )),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: style,
                    onPressed: () async {
                      await context.setLocale(Locale('kk'));
                      appBloc.add(AppStartedEvent());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "Қазақша",
                      style: TextStyle(
                          color: Colors.purple, fontFamily: 'Montserrat'),
                    )),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: style,
                    onPressed: () async {
                      await context.setLocale(Locale('en'));
                      appBloc.add(AppStartedEvent());
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(
                      "English",
                      style: TextStyle(
                          color: Colors.purple, fontFamily: 'Montserrat'),
                    )),
              ],
            )),
      ),
    );
  }
}
