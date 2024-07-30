import '../utils/shared_prefs.dart';

class AuthService {
  static Future<bool> signIn(String username, String password) async {
    final storedPassword = await SharedPrefs.getPassword(username);
    return storedPassword != null && storedPassword == password;
  }

  static Future<bool> signUp(String username, String password) async {
    if (SharedPrefs.hasUser(username)) {
      return false; // Username already exists
    }
    await SharedPrefs.setPassword(username, password);
    return true;
  }
}
