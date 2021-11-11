import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences _prefs;

  static init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<bool> putData(
      {required String key, required String value}) async {
    return await _prefs.setString(key, value);
  }

  static String? getData(String key) {
    return _prefs.getString(key);
  }
}
