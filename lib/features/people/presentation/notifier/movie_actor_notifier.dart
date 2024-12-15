import 'package:flutter_movie_app/features/movie/data/models/movie.dart';
import 'package:flutter_movie_app/features/people/domain/usecases/get_actor_movies.dart';
import 'package:flutter_movie_app/features/people/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getActorMoviesProvider =
    Provider((ref) => GetActorMovies(ref.watch(peopleRepositoryProvider)));

final actorMoviesProvider = StateNotifierProvider.family<
    DetailActorMovieNotifier, AsyncValue<List<Movie>>, int>(
  (ref, movieId) {
    final getActorDetailMovies = ref.watch(getActorMoviesProvider);
    final notifier = DetailActorMovieNotifier(getActorDetailMovies);
    return notifier;
  },
);

class DetailActorMovieNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final GetActorMovies _getActorMovies;

  DetailActorMovieNotifier(this._getActorMovies)
      : super(const AsyncValue.loading());

  bool _isGetting = false;
  bool _isLoadingNextPage = false;

  // Memuat halaman pertama
  Future<void> getInitial(int movieId) async {
    if (_isGetting) return;

    _isGetting = true;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getActorMovies(movieId); // Reset ke halaman 1

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (movies) {
        state = AsyncValue.data(movies);
      },
    );

    _isGetting = false;
  }

  // Memuat halaman berikutnya
  Future<void> getNextPage() async {
    _isLoadingNextPage = false;

    // Tampilkan state dengan status loading tambahan untuk halaman berikutnya
    state = state.when(
      data: (movies) => AsyncValue.data([...movies]), // Pertahankan data
      loading: () => const AsyncValue.loading(),
      error: (error, stack) => AsyncValue.error(error, stack),
    );
  }

  // Status apakah sedang memuat halaman berikutnya
  bool get isLoadingNextPage => _isLoadingNextPage;
}
