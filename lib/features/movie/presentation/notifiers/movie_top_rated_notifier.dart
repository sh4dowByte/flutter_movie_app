import 'package:flutter_movie_app/features/movie/domain/usecases/get_top_rated_movies.dart';
import 'package:flutter_movie_app/features/movie/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/movie.dart';

final getTopRatedMoviesProvider =
    Provider((ref) => GetTopRatedMovies(ref.watch(movieRepositoryProvider)));

final topRatedMoviesProvider =
    StateNotifierProvider<TopRatedMovieNotifier, AsyncValue<List<Movie>>>(
  (ref) {
    final getTopRatedMovies = ref.watch(getTopRatedMoviesProvider);
    return TopRatedMovieNotifier(getTopRatedMovies);
  },
);

class TopRatedMovieNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final GetTopRatedMovies _getTopRatedMovies;

  TopRatedMovieNotifier(this._getTopRatedMovies)
      : super(const AsyncValue.loading());

  int _currentPage = 1;
  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitialMovies() async {
    if (_isGetting) return;

    _isGetting = true;
    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getTopRatedMovies(1); // Reset ke halaman 1

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

    final result = await _getTopRatedMovies(_currentPage);

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
