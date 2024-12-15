import 'package:flutter_movie_app/features/people/data/models/cast.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/services/movie_services.dart';

final movieServiceProvider = Provider((ref) => MovieService(ref));

final movieCasterProvider = StateNotifierProvider.family<MovieCasterNotifier,
    AsyncValue<List<Cast>>, int>(
  (ref, movieId) {
    final getDetailMovies = ref.watch(movieServiceProvider);
    return MovieCasterNotifier(getDetailMovies);
  },
);

class MovieCasterNotifier extends StateNotifier<AsyncValue<List<Cast>>> {
  final MovieService _movieService;

  MovieCasterNotifier(this._movieService) : super(const AsyncValue.loading());

  Future<void> fetchMovieCaster(int movieId) async {
    state = const AsyncValue.loading();

    try {
      final movies = await _movieService.fetchMovieCaster(movieId);
      state = AsyncValue.data(movies);
    } catch (e, s) {
      state = AsyncValue.error(e, s);
    }
  }
}
