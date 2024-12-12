import 'package:flutter_movie_app/features/movie/data/models/movie_clip.dart';
import 'package:flutter_movie_app/features/movie/domain/usecases/get_clip_movies.dart';
import 'package:flutter_movie_app/features/movie/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getClipMoviesProvider =
    Provider((ref) => GetMovieClips(ref.watch(movieRepositoryProvider)));

final clipMoviesProvider =
    StateNotifierProvider<ClipMovieNotifier, AsyncValue<List<MovieClip>>>(
  (ref) {
    final getNowPlayingMovies = ref.watch(getClipMoviesProvider);
    return ClipMovieNotifier(getNowPlayingMovies);
  },
);

class ClipMovieNotifier extends StateNotifier<AsyncValue<List<MovieClip>>> {
  final GetMovieClips _getClipMovies;

  ClipMovieNotifier(this._getClipMovies) : super(const AsyncValue.loading());

  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitial(int movieId) async {
    if (_isGetting) return;

    _isGetting = true;

    state = const AsyncValue.loading();

    final result = await _getClipMovies(movieId);

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (movies) {
        state = AsyncValue.data(movies);
      },
    );

    _isGetting = false;
  }
}
