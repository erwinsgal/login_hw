import 'dart:developer';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final ButtonStyle style = ElevatedButton.styleFrom(
      minimumSize: const Size(150, 70),
      primary: Colors.white,
      textStyle: const TextStyle(fontSize: 20, color: Colors.purple, fontWeight: FontWeight.w400)
    );
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
                }, child: Text("Русский", style: TextStyle(color: Colors.purple, fontFamily: 'Montserrat'),)),
                SizedBox(height: 20,),
                ElevatedButton(
                    style: style,
                    onPressed: () async {
                  await context.setLocale(Locale('kk'));
                }, child: Text("Қазақша", style: TextStyle(color: Colors.purple, fontFamily: 'Montserrat'),)),
                SizedBox(height: 20,),
                ElevatedButton(
                    style: style,
                    onPressed: () async {
                  await context.setLocale(Locale('en'));
                }, child: Text("English", style: TextStyle(color: Colors.purple, fontFamily: 'Montserrat'),)),
              ],
            )),
      ),
    );
  }
}
