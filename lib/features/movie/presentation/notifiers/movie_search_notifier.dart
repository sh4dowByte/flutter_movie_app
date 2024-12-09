import 'package:flutter_movie_app/features/movie/domain/usecases/get_search_movies.dart';
import 'package:flutter_movie_app/features/movie/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/movie.dart';

final getSearchMoviesProvider =
    Provider((ref) => GetSearchMovies(ref.watch(movieRepositoryProvider)));

final searchMoviesProvider =
    StateNotifierProvider<DiscoverMovieNotifier, AsyncValue<List<Movie>>>(
  (ref) {
    final getSearchMovies = ref.watch(getSearchMoviesProvider);
    return DiscoverMovieNotifier(getSearchMovies);
  },
);

class DiscoverMovieNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final GetSearchMovies _getSearchMovies;

  DiscoverMovieNotifier(this._getSearchMovies)
      : super(const AsyncValue.loading());

  int _currentPage = 1;
  bool _isGetting = false;
  bool _isLoadingNextPage = false;
  bool _isPageEnded = false;

  late String _currentKeyword;

  // Memuat halaman pertama
  Future<void> getInitialMovies(String keywords) async {
    if (_isGetting) return;

    _isGetting = true;
    _isPageEnded = false;
    _currentKeyword = keywords;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getSearchMovies(1, keywords); // Reset ke halaman 1

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

    final result = await _getSearchMovies(_currentPage, _currentKeyword);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
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
