import 'package:flutter_movie_app/core/utils/storage/tv_genre_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Provider untuk TvGenreNotifier
final tvGenreProvider = StateNotifierProvider<TvGenreNotifier, List<String>>(
  (ref) => TvGenreNotifier(),
);

class TvGenreNotifier extends StateNotifier<List<String>> {
  TvGenreNotifier() : super([]) {
    _loadGenres(); // Muat data genre saat inisialisasi
  }

  // Fungsi untuk memuat genre dari SharedPreferences
  Future<void> _loadGenres() async {
    final savedGenres = await TvGenreStorageUtils.getGenres();
    state = savedGenres;
  }

  // Fungsi untuk menambahkan genre
  Future<void> addGenre(String genreId) async {
    if (!state.contains(genreId)) {
      state = [...state, genreId];
      await TvGenreStorageUtils.addGenre(genreId);
    }
  }

  // Fungsi untuk menghapus genre
  Future<void> removeGenre(String genreId) async {
    state =
        state.where((id) => id != genreId).toList(); // Hapus genre yang dipilih
    await TvGenreStorageUtils.removeGenre(genreId);
  }

  // Fungsi untuk memeriksa apakah genre telah diatur
  bool hasGenres() {
    return state.isNotEmpty;
  }
}
