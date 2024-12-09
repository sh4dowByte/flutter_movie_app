import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data/models/movie.dart';
import '../data/repository/movie_repository.dart';
import '../data/services/movie_services.dart';
import '../domain/usecases/fetch_upcoming_movies.dart';

final movieServiceProvider = Provider((ref) => MovieService());
final movieRepositoryProvider =
    Provider((ref) => MovieRepository(ref.watch(movieServiceProvider)));
final fetchUpcomingMoviesProvider =
    Provider((ref) => FetchUpcomingMovies(ref.watch(movieRepositoryProvider)));
final upcomingMoviesProvider =
    StateNotifierProvider<UpcomingMovieNotifier, AsyncValue<List<Movie>>>(
  (ref) {
    final fetchUpcomingMovies = ref.watch(fetchUpcomingMoviesProvider);
    return UpcomingMovieNotifier(fetchUpcomingMovies);
  },
);

class UpcomingMovieNotifier extends StateNotifier<AsyncValue<List<Movie>>> {
  final FetchUpcomingMovies _fetchUpcomingMovies;

  UpcomingMovieNotifier(this._fetchUpcomingMovies)
      : super(const AsyncValue.loading());

  int _currentPage = 1;
  bool _isFetching = false;

  // Memuat halaman pertama
  Future<void> fetchInitialMovies() async {
    if (_isFetching) return;

    _isFetching = true;
    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _fetchUpcomingMovies(1); // Reset ke halaman 1

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (movies) {
        _currentPage = 2;
        state = AsyncValue.data(movies);
      },
    );

    _isFetching = false;
  }

  // Memuat halaman berikutnya
  Future<void> fetchNextPage() async {
    if (_isFetching) return;

    _isFetching = true;

    final result = await _fetchUpcomingMovies(_currentPage);

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

    _isFetching = false;
  }
}
