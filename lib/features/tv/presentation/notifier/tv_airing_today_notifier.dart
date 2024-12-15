import 'package:flutter_movie_app/features/tv/data/models/tv.dart';
import 'package:flutter_movie_app/features/tv/domain/usecases/get_airing_today_tv.dart';
import 'package:flutter_movie_app/features/tv/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAiringTvTodayProvider =
    Provider((ref) => GetAiringTodayTv(ref.watch(tvRepositoryProvider)));

final airingTvTodayProvider =
    StateNotifierProvider<AiringTvTodayNotifier, AsyncValue<List<Tv>>>(
  (ref) {
    final getAiringTvToday = ref.watch(getAiringTvTodayProvider);
    return AiringTvTodayNotifier(getAiringTvToday);
  },
);

class AiringTvTodayNotifier extends StateNotifier<AsyncValue<List<Tv>>> {
  final GetAiringTodayTv _getData;

  AiringTvTodayNotifier(this._getData) : super(const AsyncValue.loading());

  int _currentPage = 1;
  bool _isGetting = false;
  bool _isLoadingNextPage = false;
  bool _isPageEnded = false;

  // Memuat halaman pertama
  Future<void> getInitial() async {
    if (_isGetting) return;

    _isGetting = true;
    _isPageEnded = false;

    state = const AsyncValue.loading(); // Tampilkan loading untuk data awal

    final result = await _getData(1); // Reset ke halaman 1

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (movies) {
        _currentPage = 2;
        state = AsyncValue.data(movies);
      },
    );

    _isGetting = false;
  }

  // Memuat halaman berikutnya
  Future<void> getNextPage() async {
    if (_isGetting || _isLoadingNextPage || _isPageEnded) return;

    _isLoadingNextPage = true;

    // Tampilkan state dengan status loading tambahan untuk halaman berikutnya
    state = state.when(
      data: (movies) => AsyncValue.data([...movies]), // Pertahankan data
      loading: () => const AsyncValue.loading(),
      error: (error, stack) => AsyncValue.error(error, stack),
    );

    final result = await _getData(_currentPage);

    result.fold(
      (failure) {},
      (movies) {
        state = AsyncValue.data([
          ...(state.value ?? []), // Data sebelumnya
          ...movies,
        ]);
        if (movies.isNotEmpty) {
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
