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
  bool _isLoadingNextPage = false;
  bool _isPageEnded = false;

  // Memuat halaman pertama
  Future<void> getInitialMovies() async {
    if (_isGetting) return;

    _isGetting = true;
    _isPageEnded = false;

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
    if (_isGetting || _isLoadingNextPage || _isPageEnded) return;

    _isLoadingNextPage = true;

    // Tampilkan state dengan status loading tambahan untuk halaman berikutnya
    state = state.when(
      data: (movies) => AsyncValue.data([...movies]), // Pertahankan data
      loading: () => const AsyncValue.loading(),
      error: (error, stack) => AsyncValue.error(error, stack),
    );

    final result = await _getTopRatedMovies(_currentPage);

    result.fold(
      (failure) {
        // state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (movies) {
        state = AsyncValue.data([
          ...(state.value ?? []), // Data sebelumnya
          ...movies,
        ]);
        if (movies.isNotEmpty) {
          _currentPage++;
        } else {
          _isPageEnded = true;
        }
      },
    );

    _isLoadingNextPage = false;
  }

  bool get isLoadingNextPage => _isLoadingNextPage;
}
