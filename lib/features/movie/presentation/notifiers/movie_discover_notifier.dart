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
  bool _isLoadingNextPage = false;
  bool _isPageEnded = false;

  // Memuat halaman pertama
  Future<void> getInitialMovies({genreId = 0}) async {
    if (_isGetting) return;

    _isGetting = true;
    _isPageEnded = false;
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

  Future<void> getNextPage() async {
    if (_isGetting || _isLoadingNextPage || _isPageEnded) return;

    _isLoadingNextPage = true;

    // Tampilkan state dengan status loading tambahan untuk halaman berikutnya
    state = state.when(
      data: (movies) => AsyncValue.data([...movies]), // Pertahankan data
      loading: () => const AsyncValue.loading(),
      error: (error, stack) => AsyncValue.error(error, stack),
    );

    final result = await _getDiscoverMovies(_currentPage, _currentGenre);

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

  // Status apakah sedang memuat halaman berikutnya
  bool get isLoadingNextPage => _isLoadingNextPage;
}
