
import 'package:shared_preferences/shared_preferences.dart';

class PrefsUtils {
  static late SharedPreferences _prefs;

  // Initialize SharedPreferences
  static Future<SharedPreferences> init() async {
    _prefs = await SharedPreferences.getInstance();
    return _prefs;
  }

  // Check if it's the first time the app is being used
  static Future<bool> isFirstTime() async {
    bool res = _prefs.getBool(PrefsKeys.isFirstTime) ?? true;
    _prefs.setBool(PrefsKeys.isFirstTime, false);
    return res;
  }

  // Save user info as a string 
  static Future setUserInfo(String value) async {
    await _prefs.setString(PrefsKeys.userInfo, value);
  }

  // Retrieve user info
  static String? getUserInfo() {
    return _prefs.getString(PrefsKeys.userInfo);
  }

  // Check if user is logged in by verifying if user info exists
  static Future<bool> isLoggedIn() async {
    return _prefs.getString(PrefsKeys.userInfo) != null;
  }

  // Delete a specific key 
  static Future delete(String key) async {
    await _prefs.remove(key);
  }
}

class PrefsKeys {
  static const isFirstTime = 'isFirstTime';
  static const userInfo = 'user';
}
