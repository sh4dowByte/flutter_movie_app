import 'package:flutter_movie_app/features/people/data/models/actor.dart';
import 'package:flutter_movie_app/features/people/domain/usecases/get_actor_detail.dart';
import 'package:flutter_movie_app/features/movie/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getActorDetailMoviesProvider =
    Provider((ref) => GetActorDetail(ref.watch(movieRepositoryProvider)));

final actorActorDetailMoviesProvider =
    StateNotifierProvider.family<DetailActorNotifier, AsyncValue<Actor>, int>(
  (ref, movieId) {
    final getActorDetailMovies = ref.watch(getActorDetailMoviesProvider);
    final notifier = DetailActorNotifier(getActorDetailMovies);
    return notifier;
  },
);

class DetailActorNotifier extends StateNotifier<AsyncValue<Actor>> {
  final GetActorDetail _getActorDetailMovies;

  DetailActorNotifier(this._getActorDetailMovies)
      : super(const AsyncValue.loading());

  bool _isGetting = false;

  // Memuat halaman pertama
  Future<void> getInitial(int personId) async {
    if (_isGetting) return;

    _isGetting = true;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getActorDetailMovies(personId); // Reset ke halaman 1

    result.fold(
      (failure) {
        state = AsyncValue.error(failure, StackTrace.current);
      },
      (actor) {
        state = AsyncValue.data(actor);
      },
    );

    _isGetting = false;
  }
}
