import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page_hw/pages/login_page.dart';
import 'package:login_page_hw/pages/main_page.dart';

import '../translations/locale_keys.g.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       routes: {
//         '/login': (context) => const FirstPage(),
//         '/register': (context) => const SecondPage()
//       },
//     );
//   }
// }
//
// class SecondPage extends StatelessWidget {
//   const SecondPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              children:  [
                Padding(
                  padding: EdgeInsets.all(7),
                  child: Text(
                    LocaleKeys.register.tr(),
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.purple,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                RegisterBox()
              ],
            )),
      ),
    );
  }
}

class RegisterBox extends StatelessWidget {
  const RegisterBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 330,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 30),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(),
                hintText: LocaleKeys.inputusername.tr(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
                hintText: LocaleKeys.inputphone.tr(),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 8),
            child: TextField(
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                border: OutlineInputBorder(),
                hintText: LocaleKeys.inputpassword.tr(),
              ),
            ),
          ),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => WelcomePage(),
                  ),
                );
              },
              child: Text(LocaleKeys.buttonSubmit.tr()),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LocaleKeys.haveacc.tr()),
                TextButton(
                  style: TextButton.styleFrom(
                    primary: Colors.purple
                  ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage(),
                        ),
                      );
                    },
                    child: Text(LocaleKeys.buttonSign.tr()))
              ],
            ),
          )
        ],
      ),
    );
  }
}
