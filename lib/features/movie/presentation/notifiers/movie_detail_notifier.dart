import 'package:flutter_movie_app/features/movie/data/models/movie_detail.dart';
import 'package:flutter_movie_app/features/movie/domain/usecases/get_detail_movies.dart.dart';
import 'package:flutter_movie_app/features/movie/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDetailMoviesProvider =
    Provider((ref) => GetDetailMovies(ref.watch(movieRepositoryProvider)));

final detailMoviesProvider =
    StateNotifierProvider<DetailMovieNotifier, AsyncValue<MovieDetail>>(
  (ref) {
    final getDetailMovies = ref.watch(getDetailMoviesProvider);
    return DetailMovieNotifier(getDetailMovies);
  },
);

class DetailMovieNotifier extends StateNotifier<AsyncValue<MovieDetail>> {
  final GetDetailMovies _getDetailMovies;

  DetailMovieNotifier(this._getDetailMovies)
      : super(const AsyncValue.loading());

  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitial(int movieId) async {
    if (_isGetting) return;

    _isGetting = true;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getDetailMovies(movieId); // Reset ke halaman 1

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
