import 'package:shared_preferences/shared_preferences.dart';

class MovieGenreStorageUtils {
  // Fungsi untuk mendapatkan daftar genre dari SharedPreferences
  static Future<List<String>> getGenres() async {
    final prefs = await SharedPreferences.getInstance();
    final genres = prefs.getStringList('movie_genres') ?? [];
    return genres;
  }

  static Future<String> getGenresStr() async {
    final prefs = await SharedPreferences.getInstance();
    final genres = prefs.getStringList('movie_genres') ?? [];
    return genres.join(',');
  }

  // Fungsi untuk menyimpan daftar genre ke SharedPreferences
  static Future<void> setGenres(List<String> genres) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('movie_genres', genres);
  }

  // Fungsi untuk menambahkan genre ke SharedPreferences
  static Future<void> addGenre(String genre) async {
    final prefs = await SharedPreferences.getInstance();
    final currentGenres = prefs.getStringList('movie_genres') ?? [];
    if (!currentGenres.contains(genre)) {
      currentGenres.add(genre);
      await prefs.setStringList('movie_genres', currentGenres);
    }
  }

  // Fungsi untuk menghapus genre dari SharedPreferences
  static Future<void> removeGenre(String genre) async {
    final prefs = await SharedPreferences.getInstance();
    final currentGenres = prefs.getStringList('movie_genres') ?? [];
    currentGenres.remove(genre);
    await prefs.setStringList('movie_genres', currentGenres);
  }
}
