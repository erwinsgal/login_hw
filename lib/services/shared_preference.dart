import 'package:shared_preferences/shared_preferences.dart';

final sharedPreference = SharedPreferencesHelper();

class SharedPreferencesHelper {
  late SharedPreferences _sharedPreferences;
  static const String USER_NAME = "userName";
  static const String USER_PHONE = "userPhone";
  static const String USER_PASSWORD = "userPassword";
  static const String AUTH_STATUS = "authStatus";


  init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }
  Future<bool> get authStatus async {
    return _sharedPreferences.getBool(AUTH_STATUS) ?? false;
  }
  void saveAuthStatus(bool value) async{
    _sharedPreferences.setBool(AUTH_STATUS, value);
  }

  Future<void>saveUserName(String userName) async {
    _sharedPreferences.setString(USER_NAME, userName);
  }

  String? get getUserName{
    return _sharedPreferences.getString(USER_NAME);
  }

}