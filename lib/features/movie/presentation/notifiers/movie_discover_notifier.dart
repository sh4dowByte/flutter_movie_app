import 'package:flutter_movie_app/features/movie/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/movie.dart';
import '../../domain/usecases/get_discover_movies.dart';

final getDiscoverMoviesProvider =
    Provider((ref) => GetDiscoverMovies(ref.watch(movieRepositoryProvider)));

final discoverMoviesProvider =
    StateNotifierProvider<DiscoverMovieNotifier, AsyncValue<List<Movie>>>(
  (ref) {
    final getDiscoverMovies = ref.watch(getDiscoverMoviesProvider);
    return DiscoverMovieNotifier(getDiscoverMovies);
  },
);

class DiscoverMovieNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final GetDiscoverMovies _getDiscoverMovies;

  DiscoverMovieNotifier(this._getDiscoverMovies)
      : super(const AsyncValue.loading());

  int _currentPage = 1;
  int _currentGenre = 0;
  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitialMovies({genreId = 0}) async {
    if (_isGetting) return;

    _isGetting = true;
    _currentGenre = genreId;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getDiscoverMovies(1, genreId); // Reset ke halaman 1

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

    final result = await _getDiscoverMovies(_currentPage, _currentGenre);

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
