import 'package:flutter_movie_app/features/favorite/data/models/favorite.dart';
import 'package:flutter_movie_app/features/favorite/domain/usecases/movie/add_favorite_movies.dart';
import 'package:flutter_movie_app/features/favorite/domain/usecases/movie/get_favorite_movies.dart';
import 'package:flutter_movie_app/features/favorite/domain/usecases/movie/remove_favorite_movies.dart';
import 'package:flutter_movie_app/features/favorite/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getFavoriteMoviesProvider =
    Provider((ref) => GetFavoriteMovies(ref.watch(movieRepositoryProvider)));

final addFavoriteMoviesProvider =
    Provider((ref) => AddFavoriteMovies(ref.watch(movieRepositoryProvider)));

final removeFavoriteMoviesProvider =
    Provider((ref) => RemoveFavoriteMovies(ref.watch(movieRepositoryProvider)));

final favoriteMoviesProvider =
    StateNotifierProvider<FavoriteMovieNotifier, AsyncValue<List<Favorite>>>(
  (ref) {
    final getFavoriteMovies = ref.watch(getFavoriteMoviesProvider);
    final addFavoriteMovies = ref.watch(addFavoriteMoviesProvider);
    final removeFavoriteMovies = ref.watch(removeFavoriteMoviesProvider);
    return FavoriteMovieNotifier(
        getFavoriteMovies, addFavoriteMovies, removeFavoriteMovies);
  },
);

class FavoriteMovieNotifier extends StateNotifier<AsyncValue<List<Favorite>>> {
  final GetFavoriteMovies _getFavoriteMovies;
  final AddFavoriteMovies _addFavoriteMovies;
  final RemoveFavoriteMovies _removeFavoriteMovies;

  FavoriteMovieNotifier(this._getFavoriteMovies, this._addFavoriteMovies,
      this._removeFavoriteMovies)
      : super(const AsyncValue.loading());

  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getFavoriteMovie() async {
    if (_isGetting) return;

    _isGetting = true;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getFavoriteMovies(); // Reset ke halaman 1

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (actor) {
        state = AsyncValue.data(actor);
      },
    );

    _isGetting = false;
  }

  // Toggle Favorite Movie
  Future<void> toggleFavoriteMovie(Favorite fav) async {
    final currentFavorites = state.asData?.value ?? [];

    if (_isFavorite(fav.id)) {
      // Jika film sudah ada, hapus dari daftar favorit
      await _removeFavoriteMovies(fav.id);

      // Perbarui state
      state = AsyncValue.data(
          currentFavorites.where((m) => m.id != fav.id).toList());

      if (state.asData!.value.isEmpty) {
        getFavoriteMovie();
      }
    } else {
      // Jika film belum ada, tambahkan ke daftar favorit
      await _addFavoriteMovies(fav);

      // Perbarui state
      getFavoriteMovie();
    }
  }

  bool _isFavorite(int movieId) {
    final favoriteMovies = state.asData?.value ?? [];
    return favoriteMovies.any((movie) => movie.id == movieId);
  }
}
