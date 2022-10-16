import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../model/user.dart';

class RegisterFormPage extends StatefulWidget {
  const RegisterFormPage({Key? key}) : super(key: key);

  @override
  State<RegisterFormPage> createState() => _RegisterFormPageState();
}

class _RegisterFormPageState extends State<RegisterFormPage> {
  bool _hidePass = true;

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _nameFocus = FocusNode();
  final _phoneFocus = FocusNode();
  final _passFocus = FocusNode();

  User newUser = User();

  @override
  void dispose() {
    _nameController.dispose();
    _phoneController.dispose();
    _emailController.dispose();
    _passController.dispose();
    _nameFocus.dispose();
    _phoneFocus.dispose();
    _passFocus.dispose();
    super.dispose();
  }

  void _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/background.jpg'),
          fit: BoxFit.cover,
        )),
        child: Container(
            child: Form(
          key: _formKey,
          child: Container(

            alignment: Alignment.center,
            child: Column(
              // padding: const EdgeInsets.all(16.0),
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ColoredBox(color: Colors.white),
                TextFormField(
                  focusNode: _nameFocus,
                  autofocus: true,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _nameFocus, _phoneFocus);
                  },
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Full Name *',
                    hintText: 'What do people call you?',
                    prefixIcon: const Icon(Icons.person),
                    suffixIcon: GestureDetector(
                      onTap: () {
                        _nameController.clear();
                      },
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  onSaved: (value) => newUser.name = value!,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  focusNode: _phoneFocus,
                  onFieldSubmitted: (_) {
                    _fieldFocusChange(context, _phoneFocus, _passFocus);
                  },
                  controller: _phoneController,
                  decoration: InputDecoration(
                    labelText: 'Phone Number *',
                    hintText: 'Where can we reach you?',
                    helperText: 'Phone format: (XXX)XXX-XXXX',
                    prefixIcon: const Icon(Icons.call),
                    suffixIcon: GestureDetector(
                      onLongPress: () {
                        _phoneController.clear();
                      },
                      child: const Icon(
                        Icons.delete_outline,
                        color: Colors.red,
                      ),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.black, width: 2.0),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0)),
                      borderSide: BorderSide(color: Colors.blue, width: 2.0),
                    ),
                  ),
                  keyboardType: TextInputType.phone,
                  inputFormatters: [
                    // FilteringTextInputFormatter.digitsOnly,
                    FilteringTextInputFormatter(RegExp(r'^[()\d -]{1,15}$'),
                        allow: true),
                  ],
                  onSaved: (value) => newUser.phone = value!,
                ),
                const SizedBox(height: 10),
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email Address',
                    hintText: 'Enater a email address',
                    icon: Icon(Icons.mail),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  // validator: _validateEmail,
                  onSaved: (value) => newUser.email = value!,
                ),
                const SizedBox(height: 20),
                TextFormField(
                  focusNode: _passFocus,
                  controller: _passController,
                  obscureText: _hidePass,
                  maxLength: 8,
                  decoration: InputDecoration(
                    labelText: 'Password *',
                    hintText: 'Enter the password',
                    suffixIcon: IconButton(
                      icon: Icon(
                          _hidePass ? Icons.visibility : Icons.visibility_off),
                      onPressed: () {
                        setState(() {
                          _hidePass = !_hidePass;
                        });
                      },
                    ),
                    icon: const Icon(Icons.security),
                  ),
                ),
                const SizedBox(height: 10),
              ],
            ),
          ),
        )),
      ),
    );
  }
}
