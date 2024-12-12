import 'package:flutter_movie_app/features/favorite/domain/usecases/add_favorite_movies.dart';
import 'package:flutter_movie_app/features/favorite/domain/usecases/get_favorite_movies.dart';
import 'package:flutter_movie_app/features/favorite/domain/usecases/remove_favorite_movies.dart';
import 'package:flutter_movie_app/features/favorite/presentation/providers.dart';
import 'package:flutter_movie_app/features/movie/data/models/movie.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getFavoriteMoviesProvider =
    Provider((ref) => GetFavoriteMovies(ref.watch(repositoryProvider)));

final addFavoriteMoviesProvider =
    Provider((ref) => AddFavoriteMovies(ref.watch(repositoryProvider)));

final removeFavoriteMoviesProvider =
    Provider((ref) => RemoveFavoriteMovies(ref.watch(repositoryProvider)));

final favoriteMoviesProvider =
    StateNotifierProvider<FavoriteMovieNotifier, AsyncValue<List<Movie>>>(
  (ref) {
    final getFavoriteMovies = ref.watch(getFavoriteMoviesProvider);
    final addFavoriteMovies = ref.watch(addFavoriteMoviesProvider);
    final removeFavoriteMovies = ref.watch(removeFavoriteMoviesProvider);
    return FavoriteMovieNotifier(
        getFavoriteMovies, addFavoriteMovies, removeFavoriteMovies);
  },
);

class FavoriteMovieNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
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
  Future<void> toggleFavoriteMovie(Movie movie) async {
    final currentFavorites = state.asData?.value ?? [];

    if (_isFavorite(movie.id)) {
      // Jika film sudah ada, hapus dari daftar favorit
      await _removeFavoriteMovies(movie.id);

      // Perbarui state
      state = AsyncValue.data(
          currentFavorites.where((m) => m.id != movie.id).toList());

      if (state.asData!.value.isEmpty) {
        getFavoriteMovie();
      }
    } else {
      // Jika film belum ada, tambahkan ke daftar favorit
      await _addFavoriteMovies(movie);

      // Perbarui state
      state = AsyncValue.data([...currentFavorites, movie]);
    }
  }

  bool _isFavorite(int movieId) {
    final favoriteMovies = state.asData?.value ?? [];
    return favoriteMovies.any((movie) => movie.id == movieId);
  }
}
