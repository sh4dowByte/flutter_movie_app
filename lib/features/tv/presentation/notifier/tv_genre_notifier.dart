import 'package:flutter_movie_app/features/movie/data/models/genres.dart';
import 'package:flutter_movie_app/features/tv/domain/usecases/get_genre_tv.dart';
import 'package:flutter_movie_app/features/tv/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getGenreTvProvider =
    Provider((ref) => GetGenreTv(ref.watch(tvRepositoryProvider)));

final genreTvProvider =
    StateNotifierProvider<GenreMovieNotifier, AsyncValue<List<Genres>>>(
  (ref) {
    final getGenreTv = ref.watch(getGenreTvProvider);
    return GenreMovieNotifier(getGenreTv);
  },
);

class GenreMovieNotifier extends StateNotifier<AsyncValue<List<Genres>>> {
  final GetGenreTv _getGenreTv;

  GenreMovieNotifier(this._getGenreTv) : super(const AsyncValue.loading());

  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitial() async {
    if (_isGetting) return;

    _isGetting = true;
    state = const AsyncValue.loading();

    final result = await _getGenreTv();

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (genre) {
        state = AsyncValue.data(genre);
      },
    );

    _isGetting = false;
  }
}
