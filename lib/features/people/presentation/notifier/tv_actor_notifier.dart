import 'package:flutter_movie_app/features/people/domain/usecases/get_actor_tv.dart';
import 'package:flutter_movie_app/features/people/presentation/providers.dart';
import 'package:flutter_movie_app/features/tv/data/models/tv.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getActorTvProvider =
    Provider((ref) => GetActorTv(ref.watch(peopleRepositoryProvider)));

final actorTvProvider = StateNotifierProvider.family<DetailActorTvNotifier,
    AsyncValue<List<Tv>>, int>(
  (ref, seriesId) {
    final getActorDetailTv = ref.watch(getActorTvProvider);
    final notifier = DetailActorTvNotifier(getActorDetailTv);
    return notifier;
  },
);

class DetailActorTvNotifier extends StateNotifier<AsyncValue<List<Tv>>> {
  final GetActorTv _getActorTv;

  DetailActorTvNotifier(this._getActorTv) : super(const AsyncValue.loading());

  bool _isGetting = false;
  bool _isLoadingNextPage = false;

  // Memuat halaman pertama
  Future<void> getInitial(int seriesId) async {
    if (_isGetting) return;

    _isGetting = true;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getActorTv(seriesId); // Reset ke halaman 1

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
