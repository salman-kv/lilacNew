import 'package:shared_preferences/shared_preferences.dart';

class SharedPref {
  static late SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static set({required String key, required String value}) async {
    await sharedPreferences.setString(key, value);
  }

  static get({required String key}) async {
    return sharedPreferences.get(key);
  }
}
