import 'package:flutter_movie_app/features/movie/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/movie.dart';
import '../../domain/usecases/get_popular_movies.dart';

final getPopularMoviesProvider =
    Provider((ref) => GetPopularMovies(ref.watch(movieRepositoryProvider)));

final popularMoviesProvider =
    StateNotifierProvider<PopularMovieNotifier, AsyncValue<List<Movie>>>(
  (ref) {
    final getPopularMovies = ref.watch(getPopularMoviesProvider);
    return PopularMovieNotifier(getPopularMovies);
  },
);

class PopularMovieNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final GetPopularMovies _getPopularMovies;

  PopularMovieNotifier(this._getPopularMovies)
      : super(const AsyncValue.loading());

  int _currentPage = 1;
  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitialMovies() async {
    if (_isGetting) return;

    _isGetting = true;
    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getPopularMovies(1); // Reset ke halaman 1

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

    final result = await _getPopularMovies(_currentPage);

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
