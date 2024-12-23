import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageUtils {
  static Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('language') ?? 'id';
  }

  static Future<String> getIsAdult() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('language') ?? 'id';
  }
}
