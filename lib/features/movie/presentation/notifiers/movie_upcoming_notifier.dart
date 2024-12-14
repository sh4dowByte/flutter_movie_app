import 'package:flutter_movie_app/features/movie/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/movie.dart';
import '../../domain/usecases/get_upcoming_movies.dart';

final getUpcomingMoviesProvider =
    Provider((ref) => GetUpcomingMovies(ref.watch(movieRepositoryProvider)));

final upcomingMoviesProvider =
    StateNotifierProvider<UpcomingMovieNotifier, AsyncValue<List<Movie>>>(
  (ref) {
    final getUpcomingMovies = ref.watch(getUpcomingMoviesProvider);
    return UpcomingMovieNotifier(getUpcomingMovies);
  },
);

class UpcomingMovieNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final GetUpcomingMovies _getUpcomingMovies;

  UpcomingMovieNotifier(this._getUpcomingMovies)
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

    final result = await _getUpcomingMovies(1); // Reset ke halaman 1

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

    final result = await _getUpcomingMovies(_currentPage);

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
