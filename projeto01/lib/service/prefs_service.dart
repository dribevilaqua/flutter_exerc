import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsService {
  static const String _key = 'key';

  static Future<void> save(String user) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(
      _key,
      jsonEncode({
        'user': user,
        'isAuthenticated': true,
      }),
    );
  }

  static Future<bool> isAuthenticated() async {
    final prefs = await SharedPreferences.getInstance();
    final jsonResult = prefs.getString(_key);

    if (jsonResult != null) {
      final mapUser = jsonDecode(jsonResult);
      return mapUser['isAuthenticated'];
    }
    return false;
  }
  static Future<void> logout() async {
        final prefs = await SharedPreferences.getInstance();
        await prefs.remove(_key);
  }
}
