import 'package:flutter_movie_app/core/utils/storage/movie_genre_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider untuk MovieGenreNotifier
final movieGenreProvider =
    StateNotifierProvider<MovieGenreNotifier, List<String>>(
  (ref) => MovieGenreNotifier(),
);

class MovieGenreNotifier extends StateNotifier<List<String>> {
  MovieGenreNotifier() : super([]) {
    _loadGenres(); // Muat data genre saat inisialisasi
  }

  // Fungsi untuk memuat genre dari SharedPreferences
  Future<void> _loadGenres() async {
    final savedGenres = await MovieGenreStorageUtils.getGenres();
    state = savedGenres;
  }

  // Fungsi untuk menambahkan genre
  Future<void> addGenre(String genreId) async {
    if (!state.contains(genreId)) {
      state = [...state, genreId];
      await MovieGenreStorageUtils.addGenre(genreId);
    }
  }

  // Fungsi untuk menghapus genre
  Future<void> removeGenre(String genreId) async {
    state =
        state.where((id) => id != genreId).toList(); // Hapus genre yang dipilih
    await MovieGenreStorageUtils.removeGenre(genreId);
  }

  // Fungsi untuk memeriksa apakah genre telah diatur
  bool hasGenres() {
    return state.isNotEmpty;
  }
}
