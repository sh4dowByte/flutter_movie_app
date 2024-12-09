import 'package:flutter_movie_app/features/movie/data/models/genres.dart';
import 'package:flutter_movie_app/features/movie/domain/usecases/get_genre_movies.dart';
import 'package:flutter_movie_app/features/movie/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getGenreMoviesProvider =
    Provider((ref) => GetGenreMovies(ref.watch(movieRepositoryProvider)));

final genreMoviesProvider =
    StateNotifierProvider<GenreMovieNotifier, AsyncValue<List<Genres>>>(
  (ref) {
    final getGenreMovies = ref.watch(getGenreMoviesProvider);
    return GenreMovieNotifier(getGenreMovies);
  },
);

class GenreMovieNotifier extends StateNotifier<AsyncValue<List<Genres>>> {
  final GetGenreMovies _getGenreMovies;

  GenreMovieNotifier(this._getGenreMovies) : super(const AsyncValue.loading());

  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitial() async {
    if (_isGetting) return;

    _isGetting = true;
    state = const AsyncValue.loading();

    final result = await _getGenreMovies();

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (genre) {
        state = AsyncValue.data(genre);
      },
    );

    _isGetting = false;
  }
}
