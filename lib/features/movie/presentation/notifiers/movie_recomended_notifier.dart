import 'package:flutter_movie_app/features/movie/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/movie.dart';
import '../../domain/usecases/get_recomended_movies.dart';

final getRecomendedMoviesProvider =
    Provider((ref) => GetRecomendedMovies(ref.watch(movieRepositoryProvider)));

final recomendedMoviesProvider =
    StateNotifierProvider<RecomendedMovieNotifier, AsyncValue<List<Movie>>>(
  (ref) {
    final getRecomendedMovies = ref.watch(getRecomendedMoviesProvider);
    return RecomendedMovieNotifier(getRecomendedMovies);
  },
);

class RecomendedMovieNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final GetRecomendedMovies _getRecomendedMovies;

  RecomendedMovieNotifier(this._getRecomendedMovies)
      : super(const AsyncValue.loading());

  int _currentPage = 1;
  int _currentMovieId = 0;
  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitialMovies(movieId) async {
    if (_isGetting) return;

    _isGetting = true;
    _currentMovieId = movieId;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getRecomendedMovies(1, movieId); // Reset ke halaman 1

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (movies) {
        _currentPage = 2;
        state = AsyncValue.data(movies);
      },
    );

    _isGetting = false;
  }

  // Memuat halaman berikutnya
  Future<void> getNextPage() async {
    if (_isGetting) return;

    _isGetting = true;

    final result = await _getRecomendedMovies(_currentPage, _currentMovieId);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (movies) {
        if (movies.isNotEmpty) {
          _currentPage++;
          state = AsyncValue.data([
            ...(state.value ?? []), // Data sebelumnya
            ...movies,
          ]);
        }
      },
    );

    _isGetting = false;
  }
}
