import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static late SharedPreferences _prefs;

  static Future<void> init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  static Future<void> setUsername(String username) async {
    await _prefs.setString('currentUser', username);
  }

  static String? getUsername() {
    return _prefs.getString('currentUser');
  }

  static Future<void> clear() async {
    await _prefs.remove('currentUser');
  }

  static Future<void> setPassword(String username, String password) async {
    await _prefs?.setString(username, password);
  }

  static String? getPassword(String username) {
    return _prefs?.getString(username);
  }

  static bool hasUser(String username) {
    return _prefs?.containsKey(username) ?? false;
  }
}
