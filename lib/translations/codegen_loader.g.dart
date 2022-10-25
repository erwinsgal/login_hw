// DO NOT EDIT. This is code generated via package:easy_localization/generate.dart

// ignore_for_file: prefer_single_quotes

import 'dart:ui';

import 'package:easy_localization/easy_localization.dart' show AssetLoader;

class CodegenLoader extends AssetLoader{
  const CodegenLoader();

  @override
  Future<Map<String, dynamic>> load(String fullPath, Locale locale ) {
    return Future.value(mapLocales[locale.toString()]);
  }

  static const Map<String,dynamic> en = {
  "register": "REGISTRATION",
  "inputusername": "Username / Email",
  "inputphone": "Phone number",
  "inputpassword": "Password",
  "buttonSubmit": "Sign Up",
  "haveacc": "Already have an account?",
  "buttonSign": "Sing in",
  "welcome": "WELCOME!",
  "noAcc": "Don't have a account?"
};
static const Map<String,dynamic> kk = {
  "register": "ТІРКЕЛУ",
  "inputusername": "Есімі/ Email",
  "inputphone": "Телефон нөмірі",
  "inputpassword": "Құпия сөз",
  "buttonSubmit": "Тіркелу",
  "haveacc": "Аккаунт бар ма?",
  "buttonSign": "Кіру",
  "welcome": "ҚОШ КЕЛДІҢІЗ!",
  "noAcc": "Аккаунт жоқ па?"
};
static const Map<String,dynamic> ru = {
  "register": "РЕГИСТРАЦИЯ",
  "inputusername": "Имя/ Email",
  "inputphone": "Номер телефона",
  "inputpassword": "Пароль",
  "buttonSubmit": "Зарегистрироваться",
  "haveacc": "Уже есть аккаунт?",
  "buttonSign": "Войти",
  "welcome": "ДОБРО ПОЖАЛОВАТЬ!",
  "noAcc": "Нет аккаунта?"
};
static const Map<String, Map<String,dynamic>> mapLocales = {"en": en, "kk": kk, "ru": ru};
}
