import 'package:flutter_movie_app/features/movie/domain/usecases/get_now_playing_movies.dart';
import 'package:flutter_movie_app/features/movie/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/models/movie.dart';

final getNowPlayingMoviesProvider =
    Provider((ref) => GetNowPlayingMovies(ref.watch(movieRepositoryProvider)));

final nowPlayingMoviesProvider =
    StateNotifierProvider<NowPlayingMovieNotifier, AsyncValue<List<Movie>>>(
  (ref) {
    final getNowPlayingMovies = ref.watch(getNowPlayingMoviesProvider);
    return NowPlayingMovieNotifier(getNowPlayingMovies);
  },
);

class NowPlayingMovieNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final GetNowPlayingMovies _getNowPlayingMovies;

  NowPlayingMovieNotifier(this._getNowPlayingMovies)
      : super(const AsyncValue.loading());

  int _currentPage = 1;
  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitialMovies() async {
    if (_isGetting) return;

    _isGetting = true;
    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getNowPlayingMovies(1); // Reset ke halaman 1

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

    final result = await _getNowPlayingMovies(_currentPage);

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
