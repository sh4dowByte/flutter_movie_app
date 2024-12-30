import 'package:flutter_dotenv/flutter_dotenv.dart';
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

  static Future<String> getStreamLink() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString('stream_link') ??
        dotenv.env['STREAM_MOVIE_API_BASE_URL'] ??
        '';
  }
}
