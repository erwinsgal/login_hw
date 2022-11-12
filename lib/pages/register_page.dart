import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:login_page_hw/pages/login_page.dart';
import 'package:login_page_hw/pages/main_page.dart';
import 'package:login_page_hw/model/user.dart';
import '../translations/locale_keys.g.dart';
import 'package:http/http.dart' as http;

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
              children: [
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
  final _formKey = GlobalKey<FormState>();
  final _containerKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();
  final _confirmPassController = TextEditingController();
  final _phoneController = TextEditingController();

  final _nameFocus = FocusNode();
  final _passFocus = FocusNode();
  final _phoneFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _confirmPassController.dispose();
    _nameFocus.dispose();
    _passFocus.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      key: _containerKey,
      width: 300,
      height: 340,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(15)),
      ),
      child: ListView(
        key: _formKey,
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 8),
            child: TextFormField(
              focusNode: _nameFocus,
              controller: _nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.mail),
                border: OutlineInputBorder(),
                hintText: LocaleKeys.inputusername.tr(),
              ),
              validator: validateName,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 8),
            child: TextFormField(
              controller: _phoneController,
              focusNode: _phoneFocus,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.phone),
                border: OutlineInputBorder(),
                hintText: LocaleKeys.inputphone.tr(),
              ),
              // validator: validatePhoneNumber,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 25, top: 0, right: 25, bottom: 8),
            child: TextFormField(
              controller: _passController,
              focusNode: _passFocus,
              decoration: InputDecoration(
                prefixIcon: Icon(Icons.key),
                border: OutlineInputBorder(),
                hintText: LocaleKeys.inputpassword.tr(),
              ),
              validator: _validatePassword,
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
              onPressed: _submitForm,
              child: Text(LocaleKeys.buttonSubmit.tr()),
            ),
          ),
          Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(LocaleKeys.haveacc.tr()),
                TextButton(
                    style: TextButton.styleFrom(primary: Colors.purple),
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

  void _submitForm() {
    {
      const url =
          'https://login-hw-62aee-default-rtdb.europe-west1.firebasedatabase.app/login_users.json';
      http.post(Uri.parse(url),
          body: jsonEncode({
            'name': _nameController.text,
            'phone': _phoneController.text,
            'password': _passController.text,
          }));
    }
  }

  //
  // void _submitForm() {
  //     _formKey.currentState!.save();
  //     _showDialog(name: _nameController.text);
  //     log('Name: ${_nameController.text}');
  //     log('Phone: ${_phoneController.text}');
  //     log('Email: ${_emailController.text}');
  //     log('Country: $_selectedCountry');
  //     log('Story: ${_storyController.text}');
  //   } else {
  //     _showMessage(message: 'Form is not valid! Please review and correct');
  //   }
  // }

  String? validateName(String? value) {
    final nameExp = RegExp(r'^[A-Za-z ]+$');
    if (value == null) {
      return 'Name is required.';
    } else if (!nameExp.hasMatch(value)) {
      return 'Please enter alphabetical characters.';
    } else {
      return null;
    }
  }

  bool validatePhoneNumber(String input) {
    final phoneExp = RegExp(r'^\(\d\d\d\)\d\d\d\-\d\d\d\d$');
    return phoneExp.hasMatch(input);
  }

  String? validateEmail(String? value) {
    if (value == null) {
      return 'Email cannot be empty';
    } else if (!_emailController.text.contains('@')) {
      return 'Invalid email address';
    } else {
      return null;
    }
  }

  String? _validatePassword(String? value) {
    if (_passController.text.length != 8) {
      return '8 character required for password';
    } else if (_confirmPassController.text != _passController.text) {
      return 'Password does not match';
    } else {
      return null;
    }
  }
//
// void _showMessage({required String message}) {
//   ScaffoldMessenger.of(context).showSnackBar(
//     SnackBar(
//       duration: const Duration(seconds: 1),
//       backgroundColor: Colors.red,
//       content: Text(
//         message,
//         style: const TextStyle(
//           color: Colors.white,
//           fontWeight: FontWeight.w600,
//           fontSize: 18.0,
//         ),
//       ),
//     ),
//   );
//
//   void _showDialog({required String name}) {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text(
//             'Registration successful',
//             style: TextStyle(
//               color: Colors.green,
//             ),
//           ),
//           content: Text(
//             '$name is now a verified register form',
//             style: const TextStyle(
//               fontWeight: FontWeight.w700,
//               fontSize: 18.0,
//             ),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 Navigator.push(
//                   context,
//                   MaterialPageRoute(
//                     builder: (context) =>
//                         UserInfoPage(
//                           userInfo: newUser,
//                         ),
//                   ),
//                 );
//               },
//               child: const Text(
//                 'Verified',
//                 style: TextStyle(
//                   color: Colors.green,
//                   fontSize: 18.0,
//                 ),
//               ),
//             ),
//           ],
//         );
//       },
//     );
//   }
}
