import 'package:flutter_movie_app/features/tv/data/models/tv.dart';
import 'package:flutter_movie_app/features/tv/domain/usecases/get_top_rated_tv.dart';
import 'package:flutter_movie_app/features/tv/presentation/providers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTopRatedTvProvider =
    Provider((ref) => GetTopRatedTv(ref.watch(tvRepositoryProvider)));

final topRatedTvProvider =
    StateNotifierProvider<TopRatedTvNotifier, AsyncValue<List<Tv>>>(
  (ref) {
    final getTopRatedTv = ref.watch(getTopRatedTvProvider);
    return TopRatedTvNotifier(getTopRatedTv);
  },
);

class TopRatedTvNotifier extends StateNotifier<AsyncValue<List<Tv>>> {
  final GetTopRatedTv _getTopRatedTv;

  TopRatedTvNotifier(this._getTopRatedTv) : super(const AsyncValue.loading());

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

    final result = await _getTopRatedTv(1); // Reset ke halaman 1

    result.fold(
      (failure) {
        state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (tv) {
        _currentPage = 2;
        state = AsyncValue.data(tv);
      },
    );

    _isGetting = false;
  }

  Future<void> getNextPage() async {
    if (_isGetting || _isLoadingNextPage || _isPageEnded) return;

    _isLoadingNextPage = true;

    // Tampilkan state dengan status loading tambahan untuk halaman berikutnya
    state = state.when(
      data: (tv) => AsyncValue.data([...tv]), // Pertahankan data
      loading: () => const AsyncValue.loading(),
      error: (error, stack) => AsyncValue.error(error, stack),
    );

    final result = await _getTopRatedTv(_currentPage);

    result.fold(
      (failure) {
        // state = AsyncValue.error(failure.message, StackTrace.current);
      },
      (tv) {
        state = AsyncValue.data([
          ...(state.value ?? []), // Data sebelumnya
          ...tv,
        ]);
        if (tv.isNotEmpty) {
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
