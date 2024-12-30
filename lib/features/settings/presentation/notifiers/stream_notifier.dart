import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final streamProvider = StateNotifierProvider<StreamNotifier, String>((ref) {
  return StreamNotifier();
});

class StreamNotifier extends StateNotifier<String> {
  StreamNotifier() : super('en') {
    _loadStream();
  }

  // Memuat nilai bahasa dari SharedPreferences
  Future<void> _loadStream() async {
    final prefs = await SharedPreferences.getInstance();
    final savedStream = prefs.getString('stream_link') ??
        dotenv.env['STREAM_MOVIE_API_BASE_URL'] ??
        '';
    state = savedStream;
  }

  // Menyimpan nilai bahasa ke SharedPreferences
  Future<void> changeStream(String newStreamLink) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('stream_link', newStreamLink);
    state = newStreamLink;
  }
}
