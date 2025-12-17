import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const String KEY_EMAIL = "user_email";
  static const String KEY_PASSWORD = "user_pass";

  // SIMPAN AKUN SAAT REGISTER
  static Future<bool> register(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    await prefs.setString(KEY_EMAIL, email);
    await prefs.setString(KEY_PASSWORD, password);
    return true;
  }

  // CEK LOGIN
  static Future<bool> login(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();

    String? savedEmail = prefs.getString(KEY_EMAIL);
    String? savedPass = prefs.getString(KEY_PASSWORD);

    if (email == savedEmail && password == savedPass) {
      await prefs.setBool("is_login", true);
      return true;
    }
    return false;
  }

  // CEK APAKAH SUDAH LOGIN
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool("is_login") ?? false;
  }

  // LOGOUT
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool("is_login", false);
  }
}
