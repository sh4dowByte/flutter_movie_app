import 'package:flutter_movie_app/features/stream_movie/data/models/search_slug.dart';
import 'package:flutter_movie_app/features/stream_movie/data/services/stream_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movieStreamServiceProvider = Provider((ref) => StreamService());

final movieStreamProvider =
    StateNotifierProvider<MovieCasterNotifier, AsyncValue<List<SearchSlug>>>(
  (ref) {
    final getDetailMovies = ref.watch(movieStreamServiceProvider);
    return MovieCasterNotifier(getDetailMovies);
  },
);

class MovieCasterNotifier extends StateNotifier<AsyncValue<List<SearchSlug>>> {
  final StreamService _movieService;

  MovieCasterNotifier(this._movieService) : super(const AsyncValue.loading());

  Future<void> getSlug(String title) async {
    state = const AsyncValue.loading();

    try {
      final movies = await _movieService.fetchListSlug(title);

      if (movies.isNotEmpty) {
        state = AsyncValue.data(movies);
      } else {
        state = AsyncValue.error('Empty movie streaming', StackTrace.current);
      }
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
