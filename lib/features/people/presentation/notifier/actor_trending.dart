import 'package:flutter_movie_app/features/people/data/models/actor.dart';
import 'package:flutter_movie_app/features/people/domain/usecases/get_actor_trending.dart';
import 'package:flutter_movie_app/features/people/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getActorTrendingProvider =
    Provider((ref) => GetActorTrending(ref.watch(peopleRepositoryProvider)));

final actorTrendingProvider =
    StateNotifierProvider<TrendingActorNotifier, AsyncValue<List<Actor>>>(
  (ref) {
    final provider = ref.watch(getActorTrendingProvider);
    return TrendingActorNotifier(provider);
  },
);

class TrendingActorNotifier extends StateNotifier<AsyncValue<List<Actor>>> {
  final GetActorTrending _getActorTrending;

  TrendingActorNotifier(this._getActorTrending)
      : super(const AsyncValue.loading());

  int _currentPage = 4;
  bool _isGetting = false;
  bool _isLoadingNextPage = false;
  bool _isPageEnded = false;

  // Memuat halaman pertama
  Future<void> getInitial() async {
    if (_isGetting) return;

    _isGetting = true;
    _isPageEnded = false;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    List<Actor> allActor = [];
    for (int page = 1; page < _currentPage; page++) {
      final result = await _getActorTrending(page);
      result.fold(
        (failure) {
          state = AsyncValue.error(failure.message, StackTrace.current);
          _isGetting = false;
          return; // Jika ada error, keluar dari loop
        },
        (actor) {
          allActor.addAll(actor);
          if (actor.isEmpty) {
            _isPageEnded = true;
            return;
          }
        },
      );
    }

    state = AsyncValue.data(allActor);

    _isGetting = false;
  }

  Future<void> getNextPage() async {
    if (_isGetting || _isLoadingNextPage || _isPageEnded || _currentPage >= 7) {
      return;
    }

    _isLoadingNextPage = true;

    // Tampilkan state dengan status loading tambahan untuk halaman berikutnya
    state = state.when(
      data: (actor) => AsyncValue.data([...actor]), // Pertahankan data
      loading: () => const AsyncValue.loading(),
      error: (error, stack) => AsyncValue.error(error, stack),
    );

    final result = await _getActorTrending(_currentPage);

    result.fold(
      (failure) {
        // state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (actor) {
        state = AsyncValue.data([
          ...(state.value ?? []), // Data sebelumnya
          ...actor,
        ]);
        if (actor.isNotEmpty) {
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
